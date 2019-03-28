#! /bin/bash

touch NAMESPACE
R -e 'devtools::load_all(); devtools::document()'
