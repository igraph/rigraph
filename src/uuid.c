#include "vendor/uuid/uuid.h"
#include "rrandom.h"

#include <Rinternals.h>

#define RNG_BEGIN()    GetRNGstate()
#define RNG_END()      PutRNGstate()
void GetRNGstate(void);
void PutRNGstate(void);

SEXP UUID_gen(SEXP sTime) {

    RNG_BEGIN();
    int rng_loaded = igraph_rng_R_loaded();

    uuid_t u;
    char c[40];
    int use_time = asInteger(sTime);
    if (use_time == TRUE)
        uuid_generate_time(u);
    else if (use_time == FALSE)
        uuid_generate_random(u);
    else
        uuid_generate(u);
    uuid_unparse_lower(u, c);

    RNG_END();
    /* The state is saved above, so the R RNG need not save it again. */
    if (!rng_loaded) {
        igraph_rng_R_drop();
    }

    return mkString(c);
}

