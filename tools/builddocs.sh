#! /bin/bash

touch NAMESPACE
R CMD INSTALL .
R -q -e 'devtools::document()'
