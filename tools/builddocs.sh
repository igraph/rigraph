#! /bin/bash

touch NAMESPACE
R CMD INSTALL .
rm NAMESPACE
R -q -e 'devtools::document()'
