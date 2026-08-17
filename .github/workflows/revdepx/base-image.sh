#!/usr/bin/env bash
# Ensure the revdepx base image exists, and name it.
#
# The base image is rocker/r-ver plus what `R CMD check --as-cran` needs and
# an R distribution deliberately does not carry -- qpdf and ghostscript for
# the PDF checks, pandoc for vignettes, enough of TeX Live to build manuals
# and vignettes, tidy for HTML validation -- plus pak and jsonlite, so an
# image build or an in-container install can start without bootstrapping
# either. Everything downstream (the universe image, every check container)
# stands on this.
#
# Usage:
#   base-image.sh <r-version> <registry-image>   # ensure it exists, print ref
#   base-image.sh --tag-only <r-version>         # print the tag; no docker
#
# <r-version> is a RESOLVED version like 4.5.3, never an alias. The default
# of "oldrel" lives in the yaml, which resolves the alias before calling:
# an alias is a moving target, and everything downstream -- this tag, the
# baseline-validity comparison in plan.R -- needs one fixed string that
# means the same thing in every job of the run.
#
# The tag is r-<version>-<first 12 hex digits of the md5 of this very file>.
# That buys two properties at once. The image is a fixed target: as long as
# this script is byte-identical, the tag names exactly one recipe, rebuilds
# are no-ops (the manifest already exists), and a run in flight keeps the
# image it resolved. And the tag is computable *without docker and without
# running this script* -- plan.R, running in a parallel job, hashes its own
# checkout's copy of this file with tools::md5sum() and gets the same string
# for its baseline comparison. The price is that ANY edit to this file --
# the package list, a comment, this sentence -- rolls the tag and forces one
# rebuild. Accepted: a rebuild costs minutes, a tag that fails to roll on a
# recipe change serves stale images for ever, and a hash of anything less
# than the whole file would reintroduce exactly that gap.
#
# Environment:
#   REVDEPX_PUSH=1      - push :<tag> and :latest-r-<version> after building
#                         (only jobs with packages:write set this). A push
#                         failure is a warning, not an error: the image
#                         exists locally and callers on this runner can use
#                         it; callers elsewhere find no manifest and rebuild.
#   GITHUB_STEP_SUMMARY - appended to when set.
#
# Everything informational goes to stderr. The LAST line on stdout is the
# full image ref (image:tag) -- that line is what callers capture.

set -eu

hash=$(md5sum "$0" | cut -c1-12)

if [ "${1:-}" = "--tag-only" ]; then
  version=${2:?usage: base-image.sh --tag-only <r-version>}
  echo "r-${version}-${hash}"
  exit 0
fi

version=${1:?usage: base-image.sh <r-version> <registry-image>}
image=${2:?usage: base-image.sh <r-version> <registry-image>}
tag="r-${version}-${hash}"
ref="${image}:${tag}"

summary() {
  if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
    echo "$1" >> "${GITHUB_STEP_SUMMARY}"
  fi
}

# `docker manifest inspect` asks the registry without pulling anything; the
# caller has already run `docker login`. A missing manifest and a registry
# error look the same here, and are treated the same: build it ourselves.
if docker manifest inspect "${ref}" > /dev/null 2>&1; then
  echo "Base image ${ref} exists in the registry; nothing to build." >&2
  summary "Base image: reused \`${ref}\`."
  echo "${ref}"
  exit 0
fi

echo "Base image ${ref} not found in the registry; building it." >&2

# The Dockerfile, piped straight into docker build; no context directory is
# needed because nothing is COPYed. Two traps are handled inside it:
#   * rocker's baked CRAN repository is a p3m.dev snapshot frozen on the day
#     rocker built the image, so pak and jsonlite are installed from the
#     rolling `latest` binary snapshot for the image's own Ubuntu release
#     instead -- resolved from /etc/os-release, not hard-coded, so an
#     r-version whose rocker base moved to a newer Ubuntu keeps working.
#   * the org.opencontainers.image.source label ties the GHCR package to
#     this repository, which is what makes GITHUB_TOKEN pushes land in the
#     right place with the right visibility controls.
docker build --tag "${ref}" - >&2 <<EOF
FROM rocker/r-ver:${version}
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \\
    && apt-get install -y --no-install-recommends \\
      qpdf ghostscript pandoc \\
      texlive-latex-base texlive-latex-recommended texlive-latex-extra \\
      texlive-fonts-recommended texlive-fonts-extra-links fonts-dejavu \\
      tidy curl file git locales unzip \\
    && rm -rf /var/lib/apt/lists/*
RUN Rscript -e 'lines <- readLines("/etc/os-release"); \\
    codename <- sub("^VERSION_CODENAME=", "", grep("^VERSION_CODENAME=", lines, value = TRUE)[[1]]); \\
    options(repos = c(CRAN = sprintf("https://p3m.dev/cran/__linux__/%s/latest", codename))); \\
    install.packages(c("pak", "jsonlite")); \\
    stopifnot(requireNamespace("pak"), requireNamespace("jsonlite"))'
LABEL org.opencontainers.image.source=https://github.com/igraph/rigraph
EOF

if [ "${REVDEPX_PUSH:-0}" = "1" ]; then
  alias_ref="${image}:latest-r-${version}"
  if docker tag "${ref}" "${alias_ref}" >&2 \
    && docker push "${ref}" >&2 \
    && docker push "${alias_ref}" >&2; then
    echo "Pushed ${ref} and ${alias_ref}." >&2
    summary "Base image: built and pushed \`${ref}\`."
  else
    echo "WARNING: pushing ${ref} failed; the image exists locally only." >&2
    summary "Base image: built \`${ref}\` locally; the push FAILED."
  fi
else
  echo "REVDEPX_PUSH is not 1; built ${ref} locally without pushing." >&2
  summary "Base image: built \`${ref}\` locally (no push)."
fi

echo "${ref}"
