\name{update_format}
\alias{update_format}
\title{Update an igraph object to the latest data format}
\description{The internal representation of igraph graphs has been
  changed several times. This function updates (converts) an igraph
  graph in an old representation to the most current one.}
\usage{
update_format(graph)
}
\arguments{
  \item{graph}{An (old or new format) igraph object. If it is already in
  the new format, then nothing is done.}
}
\details{
  Igraph objects might be saved to disk with \code{save}, or stored
  otherwise. Then the internal file format of igraph might change, so
  that these objects are not the most current any more.

  While igraph works seamlessly with objects in the old format, this is
  costly, because for each igraph function, a conversion is done in the
  background, and this might take a long time if the graph is big, or
  many operations are performed on it. Igraph functions also give
  warnings if they encounter objects in the old format.

  It is thus suggested that you update these objects with
  \code{update_format} and re-save them.

  If your outdated igraph object is coming from the \code{igraphdata}
  package, then please install the latest version of this package.

  Note that \code{update_format} creates a new copy of the igraph
  object, and returns that. The original object is not modified.
}
\value{
  The new igraph object.
}
% \references{}
\author{Gabor Csardi \email{csardi.gabor@gmail.com}}
% \seealso{}
% \examples{}
\keyword{graphs}
