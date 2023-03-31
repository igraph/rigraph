/* -*- mode: C -*-  */
/*
   IGraph library.
   Copyright (C) 2022 The igraph development team

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

// Require R_ and Rf_ prefixes for R API
#define R_NO_REMAP

#include <Rmath.h>

#include "igraph_random.h"

#include "igraph_nongraph.h"
#include "igraph_error.h"
#include "igraph_types.h"
#include "igraph_vector.h"
#include "igraph_memory.h"

#include "core/math.h"

#include "config.h"
#include <math.h>
#include <string.h>

double  unif_rand(void);
double  norm_rand(void);
double  exp_rand(void);
double  Rf_rgeom(double);
double  Rf_rbinom(double, double);
double  Rf_rgamma(double, double);

static int igraph_rng_R_init(void **state) {
    return IGRAPH_SUCCESS;
}

static void igraph_rng_R_destroy(void *state) {
}

static int igraph_rng_R_seed(void *state, unsigned long int seed) {
    IGRAPH_ERROR("R RNG error, unsupported function called",
                 IGRAPH_EINTERNAL);
    return IGRAPH_SUCCESS;
}

static unsigned long int igraph_rng_R_get(void *state) {
    return (unsigned long) (unif_rand() * 0x7FFFFFFFUL);
}

static igraph_real_t igraph_rng_R_get_real(void *state) {
    return unif_rand();
}

static igraph_real_t igraph_rng_R_get_norm(void *state) {
    return norm_rand();
}

static igraph_real_t igraph_rng_R_get_geom(void *state, igraph_real_t p) {
    return Rf_rgeom(p);
}

static igraph_real_t igraph_rng_R_get_binom(void *state, long int n,
                                     igraph_real_t p) {
    return Rf_rbinom(n, p);
}

static igraph_real_t igraph_rng_R_get_exp(void *state, igraph_real_t rate) {
    igraph_real_t scale = 1.0 / rate;
    if (!IGRAPH_FINITE(scale) || scale <= 0.0) {
        if (scale == 0.0) {
            return 0.0;
        }
        return IGRAPH_NAN;
    }
    return scale * exp_rand();
}

static igraph_rng_type_t igraph_rng_R_type = {
    /* name= */      "GNU R",
    /* min=  */      0,
    /* max=  */      0x7FFFFFFFUL,
    /* init= */      igraph_rng_R_init,
    /* destroy= */   igraph_rng_R_destroy,
    /* seed= */      igraph_rng_R_seed,
    /* get= */       igraph_rng_R_get,
    /* get_real= */  igraph_rng_R_get_real,
    /* get_norm= */  igraph_rng_R_get_norm,
    /* get_geom= */  igraph_rng_R_get_geom,
    /* get_binom= */ igraph_rng_R_get_binom,
    /* get_exp= */   igraph_rng_R_get_exp
};

igraph_rng_t igraph_rng_R_instance;

void igraph_rng_R_install(void) {
    igraph_rng_init(&igraph_rng_R_instance, &igraph_rng_R_type);
    igraph_rng_set_default(&igraph_rng_R_instance);
}
