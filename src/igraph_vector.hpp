#pragma once

#include "igraph.h"

class igVector {
public:
    igraph_vector_int_t vec;

    igVector() { igraph_vector_int_init(&vec, 0); }

    igVector(igVector &&source) noexcept {
        vec = source.vec;
        source.vec.stor_begin = nullptr;
    }

    igVector(const igraph_vector_int_t *source) { igraph_vector_int_copy(&vec, source); }

    explicit igVector(long len) { igraph_vector_int_init(&vec, len); }

    igVector(const igVector &igv) : igVector() { igraph_vector_int_copy(&vec, &igv.vec); }

    igVector & operator = (const igVector &igv) {
        igraph_vector_int_update(&vec, &igv.vec);
        return *this;
    }

    // it is safe to call igraph_vector_destroy on a vector where vec.stor_begin == NULL
    ~igVector() { igraph_vector_int_destroy(&vec); }

    long length() const { return vec.end - vec.stor_begin; }
    long size() const { return length(); }

    igraph_integer_t *begin() { return vec.stor_begin; }
    igraph_integer_t *end() { return vec.end; }

    const igraph_integer_t *begin() const { return vec.stor_begin; }
    const igraph_integer_t *end() const { return vec.end; }

    igraph_integer_t & operator [] (size_t i) { return begin()[i]; }
    const igraph_integer_t & operator [] (size_t i) const { return begin()[i]; }

    void clear() { igraph_vector_int_clear(&vec); }

    // TODO: add check of return code
    void resize(long newsize) { igraph_vector_int_resize(&vec, newsize); }
    void reserve(long newsize) { igraph_vector_int_reserve(&vec, newsize); }

    void push_back(igraph_integer_t el) { igraph_vector_int_push_back(&vec, el); }
};
