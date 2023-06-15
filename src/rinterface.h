/* -*- mode: C -*-  */
/*
   IGraph library.
   Copyright (C) 2010  Gabor Csardi <csardi.gabor@gmail.com>
   Rue de l'Industrie 5, Lausanne 1005, Switzerland

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

#include <stdbool.h>

#include "uuid/uuid.h"

SEXP R_igraph_add_env(SEXP graph);

void R_igraph_set_in_r_check(bool set);
void R_igraph_error(void);
void R_igraph_warning(void);
void R_igraph_interrupt(void);

#define IGRAPH_R_CHECK(func) \
    do { \
        R_igraph_set_in_r_check(true); \
        igraph_error_type_t __c = func; \
        R_igraph_set_in_r_check(false); \
        R_igraph_warning(); \
        if (__c == IGRAPH_INTERRUPTED) { R_igraph_interrupt(); } \
        else if (__c != IGRAPH_SUCCESS) { R_igraph_error(); } \
    } while (0)
