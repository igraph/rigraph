# permute() validates the permutation

    Code
      permute(ring, letters[1:4])
    Condition
      Error in `permute()`:
      ! `permutation` must be a numeric vector, not a character vector.

---

    Code
      permute(ring, c(1, 2, 3))
    Condition
      Error in `permute()`:
      ! `permutation` must have length equal to the number of vertices.
      i Expected length 4, got 3.

---

    Code
      permute(ring, c(NA, 2, NA, 4))
    Condition
      Error in `permute()`:
      ! `permutation` must not contain missing values.
      i Found NA at positions 1 and 3.

---

    Code
      permute(ring, c(1.5, 2, 3, 4))
    Condition
      Error in `permute()`:
      ! `permutation` must contain whole numbers.
      i Found 1.5 at position 1.

---

    Code
      permute(ring, c(-1, 2, 3, 4))
    Condition
      Error in `permute()`:
      ! `permutation` must contain values between 1 and 4.
      i Found -1 at position 1.

---

    Code
      permute(ring, c(0, 1, 2, 5))
    Condition
      Error in `permute()`:
      ! `permutation` must contain values between 1 and 4.
      i Found 0 and 5 at positions 1 and 4.

---

    Code
      permute(ring, c(1, 1, 2, 2))
    Condition
      Error in `permute()`:
      ! `permutation` must not contain duplicate values.
      i Found 1 and 2 more than once.

