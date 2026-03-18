# Estimate mobility flows based on different trip distribution models

This function estimates mobility flows using different distribution laws
and models. As described in Lenormand *et al.* (2016), the function uses
a two-step approach to generate mobility flows by separating the trip
distribution law (gravity or intervening opportunities) from the
modeling approach used to generate the flows based on this law. This
function only uses the second step to generate mobility flow based on a
matrix of probabilities using different models.

## Usage

``` r
run_model(
  proba,
  model = "UM",
  nb_trips = 1000,
  out_trips = NULL,
  in_trips = out_trips,
  average = FALSE,
  nbrep = 3,
  maxiter = 50,
  mindiff = 0.01,
  check_names = FALSE
)
```

## Arguments

- proba:

  A squared `matrix` of probability. The sum of the matrix element must
  be equal to 1. It will be normalized automatically if it is not the
  case.

- model:

  A `character` indicating which model to use.

- nb_trips:

  A `numeric` value indicating the total number of trips. Must be an
  `integer` if `average = FALSE` (see Details).

- out_trips:

  A `numeric` vector representing the number of outgoing trips per
  location. Must be a vector of integers if `average = FALSE` (see
  Details).

- in_trips:

  A `numeric` vector representing the number of incoming trips per
  location. Must be a vector of integers if `average = FALSE` (see
  Details).

- average:

  A `boolean` indicating if the average mobility flow matrix should be
  generated instead of the `nbrep` matrices based on random draws (see
  Details).

- nbrep:

  An `integer` indicating the number of replications associated with the
  model run. Note that `nbrep = 1` if `average = TRUE` (see Details).

- maxiter:

  An `integer` indicating the maximal number of iterations for adjusting
  the Doubly Constrained Model (see Details).

- mindiff:

  A `numeric` strictly positive value indicating the stopping criterion
  for adjusting the Doubly Constrained Model (see Details).

- check_names:

  A `boolean` indicating whether the location IDs used as matrix
  rownames and colnames should be checked for consistency (see Note).

## Value

An object of class `TDLM`. A `list` of matrices containing the `nbrep`
simulated matrices.

## Details

We propose four constrained models to generate the flows from these
distribution of probability as described in Lenromand *et al.* (2016).
These models respect different level of constraints. These constraints
can preserve the total number of trips (argument `nb_trips`) OR the
number of out-going trips (argument `out_trips`) AND/OR the number of
in-coming (argument `in_trips`) according to the model. The sum of
out-going trips should be equal to the sum of in-coming trips.

1.  Unconstrained model (`model = "UM"`). Only `nb_trips` will be
    preserved (arguments `out_trips` and `in_trips` will not be used).

2.  Production constrained model (`model = "PCM"`). Only `out_trips`
    will be preserved (arguments `nb_trips` and `in_trips` will not be
    used).

3.  Attraction constrained model (`model = "ACM"`). Only `in_trips` will
    be preserved (arguments `nb_trips` and `out_trips` will not be
    used).

4.  Doubly constrained model (`model = "DCM"`). Both `out_trips` and
    `in_trips` will be preserved (arguments `nb_trips`will not be used).
    The doubly constrained model is based on an Iterative Proportional
    Fitting process (Deming & Stephan, 1940). The arguments `maxiter`
    (50 by default) and `mindiff` (0.01 by default) can be used to tune
    the model. `mindiff` is the minimal tolerated relative error between
    the simulated and observed marginals. `maxiter` ensures that the
    algorithm stops even if it has not converged toward the `mindiff`
    wanted value.

By default, when `average = FALSE`, `nbrep` matrices are generated from
`proba` with multinomial random draws that will take different forms
according to the model used. In this case, the models will deal with
positive integers as inputs and outputs. Nevertheless, it is also
possible to generate an average matrix based on a multinomial
distribution (based on an infinite number of drawings). In this case,
the models' inputs can be either positive integer or real numbers and
the output (`nbrep = 1` in this case) will be a matrix of positive real
numbers.

## Note

All inputs should be based on the same number of locations, sorted in
the same order. It is recommended to use the location ID as `matrix`
`rownames` and `matrix` `colnames` and to set `check_names = TRUE` to
verify that everything is consistent before running this function
(`check_names = FALSE` by default). Note that the function
[`check_format_names()`](https://rtdlm.github.io/TDLM/reference/check_format_names.md)
can be used to validate all inputs before running the main package's
functions.

## References

Deming WE & Stephan FF (1940) On a Least Squares Adjustment of a Sample
Frequency Table When the Expected Marginal Totals Are Known. *Annals of
Mathematical Statistics* 11, 427-444.

Lenormand M, Bassolas A, Ramasco JJ (2016) Systematic comparison of trip
distribution laws and models. *Journal of Transport Geography* 51,
158-169.

## See also

For more details illustrated with a practical example, see the vignette:
<https://rtdlm.github.io/TDLM/articles/TDLM.html#run-functions>.

Associated functions:
[`run_law_model()`](https://rtdlm.github.io/TDLM/reference/run_law_model.md),
[`run_law()`](https://rtdlm.github.io/TDLM/reference/run_law.md),
[`gof()`](https://rtdlm.github.io/TDLM/reference/gof.md).

## Author

Maxime Lenormand (<maxime.lenormand@inrae.fr>)

## Examples

``` r
data(mass)
data(od)

proba <- od / sum(od)

Oi <- as.numeric(mass[, 2])
Dj <- as.numeric(mass[, 3])

res <- run_model(
  proba = proba,
  model = "DCM", nb_trips = NULL, out_trips = Oi, in_trips = Dj,
  average = FALSE, nbrep = 3, maxiter = 50, mindiff = 0.01,
  check_names = FALSE
)

# print(res)
```
