# Check format of TDLM's inputs

This function checks that the TDLM's inputs have the required format
(and names).

## Usage

``` r
check_format_names(vectors, matrices = NULL, check = "format_and_names")
```

## Arguments

- vectors:

  A `list` of vectors. The list can contain one vector. It is
  recommended to name each element of the list. If `vectors = NULL`,
  only the matrices will be considered.

- matrices:

  A `list` of matrices. The list can contain one matrix. It is
  recommended to name each element of the list. If `matrices = NULL`,
  only the vectors will be considered (by default).

- check:

  A `character` indicating which types of check (`"format"` or
  `"format_and_names"`) should be used (see Details).

## Value

A message indicating if the check has passed or failed.

## Details

The `TDLM`'s inputs should be based on the same number of locations
sorted in the same order. `check = "format"` will run basic checks to
ensure that the structure of the inputs (dimensions, class, type...) is
correct.

It is recommended to use the location ID as `vector` `names`, `matrix`
`rownames`, and `matrix` `colnames`. Set `check = "format_and_names"` to
check the inputs' names. The checks are run successively, so run the
function as many times as needed to get the message indicating that the
inputs passed the check successfully.

## Author

Maxime Lenormand (<maxime.lenormand@inrae.fr>)

## Examples

``` r
data(mass)
data(distance)

mi <- as.numeric(mass[, 1])
names(mi) <- rownames(mass)
mj <- mi

check_format_names(
  vectors = list(mi = mi, mj = mj),
  matrices = list(distance = distance),
  check = "format_and_names"
)
#> The inputs passed the format_and_names checks successfully!
```
