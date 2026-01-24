/* -*- mode: C -*-  */
/*
   IGraph library R interface.
   Copyright (C) 2013  Gabor Csardi <csardi.gabor@gmail.com>
   334 Harvard street, Cambridge, MA 02139 USA

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
   02110-1301 USA

*/

#include "rinterface.h"

#include <R_ext/Visibility.h>

/* Test function to verify error formatting with file and line information */
attribute_visible SEXP Rx_igraph_test_error_with_source(void) {
  igraph_errorf("Test error message for verifying source location formatting",
                __FILE__, __LINE__, IGRAPH_EINVAL);
  return R_NilValue;
}
