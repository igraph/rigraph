########################################################
# Configuration variables

all: build

build:
	if ! [ -f src/config.h ]; then ./configure; fi
	R CMD INSTALL -l "/tmp" --no-configure --no-byte-compile .

docs:
	tools/builddocs.sh

igraph: igraph_$(VERSION).tar.gz

igraph_$(VERSION).tar.gz: docs
	Rscript -e 'devtools::build(path = ".")'

#############

check: igraph_$(VERSION).tar.gz
	_R_CHECK_FORCE_SUGGESTS_=0 R CMD check $<

check-cran: igraph_$(VERSION).tar.gz
	_R_CHECK_FORCE_SUGGESTS_=0 R CMD check --as-cran $<

check-links: igraph_$(VERSION).tar.gz
	mkdir -p html-docs
	R CMD INSTALL --html --no-R --no-configure --no-inst --no-libs --no-exec --no-test-load -l html-docs $<
	$(PYVENV)/bin/linkchecker html-docs/igraph/html/00Index.html ; rm -rf html-docs

check-rhub: igraph
	Rscript -e 'rhub::check_for_cran()'

check-revdeps: igraph
	Rscript -e 'options(width=204); revdepcheck::revdep_check(num_workers=8, quiet=F, bioc=F)'

install:
	Rscript -e 'devtools::install(".")'

test:
	Rscript -e 'devtools::test(".")'

clean:
	@rm -rf autom4te.cache/
	@rm -f  config.log
	@rm -f  config.status
	@rm -f  igraph_*.tar.gz
	@rm -f  igraph_*.tgz
	@rm -f  object_files
	@rm -rf version_number
	@rm -rf src/*.o
	@rm -rf src/*.so
	@cd $(top_srcdir) && git reset --hard

distclean: clean
	@rm -rf $(PYVENV)

.PHONY: all igraph force clean check check-cran check-rhub check-links install test

.NOTPARALLEL:
