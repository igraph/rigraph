# error messages are proper

    Code
      make_()
    Condition
      Error in `make_()`:
      ! could not find function "make_"
    Code
      make_(1:10)
    Condition
      Error in `make_()`:
      ! could not find function "make_"
    Code
      graph_()
    Condition
      Error in `graph_()`:
      ! could not find function "graph_"
    Code
      graph_(1:10)
    Condition
      Error in `graph_()`:
      ! could not find function "graph_"
    Code
      graph_(directed_graph(), directed_graph())
    Condition
      Error in `graph_()`:
      ! could not find function "graph_"
    Code
      sample_()
    Condition
      Error in `sample_()`:
      ! could not find function "sample_"
    Code
      sample_(1:10)
    Condition
      Error in `sample_()`:
      ! could not find function "sample_"
    Code
      sample_(directed_graph(), directed_graph())
    Condition
      Error in `sample_()`:
      ! could not find function "sample_"

# make_empty_graph gives an error for invalid arguments

    Code
      make_empty_graph(NULL)
    Condition
      Error in `make_empty_graph()`:
      ! could not find function "make_empty_graph"

---

    Code
      make_empty_graph("spam")
    Condition
      Error in `make_empty_graph()`:
      ! could not find function "make_empty_graph"

---

    Code
      make_empty_graph(10, "spam")
    Condition
      Error in `make_empty_graph()`:
      ! could not find function "make_empty_graph"

