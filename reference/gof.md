# Compute goodness-of-fit measures between observed and simulated OD matrices

This function returns a `data.frame` where each row provides one or
several goodness-of-fit measures between a simulated and an observed
Origin-Destination (OD) matrix.

## Usage

``` r
gof(
  sim,
  obs,
  measures = "all",
  distance = NULL,
  bin_size = 2,
  use_proba = FALSE,
  check_names = FALSE
)
```

## Arguments

- sim:

  An object of class `TDLM` (output of
  [`run_law_model()`](https://rtdlm.github.io/TDLM/reference/run_law_model.md),
  [`run_law()`](https://rtdlm.github.io/TDLM/reference/run_law.md), or
  [`run_model()`](https://rtdlm.github.io/TDLM/reference/run_model.md)).
  A matrix or a list of matrices can also be used (see Note).

- obs:

  A square `matrix` representing the observed mobility flows.

- measures:

  A `character` vector or a single `character` string indicating which
  goodness-of-fit measure(s) to compute (see Details). Available options
  are `"CPC"`, `"NRMSE"`, `"KL"`, `"CPL"`, `"CPC_d"` and `"KS"`. If
  `"all"` is specified, all measures will be calculated.

- distance:

  A square `matrix` representing the distances between locations. This
  is only necessary for distance-based measures.

- bin_size:

  A `numeric` value indicating the size of bins used to discretize the
  distance distribution when computing CPC_d (default is 2 kilometers).

- use_proba:

  A `boolean` indicating whether the `proba` matrix should be used
  instead of the simulated OD matrix to compute the measure(s). This is
  only valid for output from
  [`run_law_model()`](https://rtdlm.github.io/TDLM/reference/run_law_model.md)
  with the argument `write_proba = TRUE` (see Note).

- check_names:

  A `boolean` indicating whether the location IDs used as matrix
  rownames and colnames should be checked for consistency (see Note).

## Value

A `data.frame` providing one or several goodness-of-fit measures between
simulated OD(s) and an observed OD. Each row corresponds to a matrix
sorted according to the list (or list of lists) elements (names are used
if provided).

## Details

Several goodness-of-fit measures are considered, such as the Common Part
of Commuters (CPC), the Common Part of Links (CPL), and the Common Part
of Commuters based on the distance (CPC_d), as described in [Lenormand
*et al.* (2016)](https://arxiv.org/abs/1506.04889). It also includes
classical metrics such as the [Normalized Root Mean Square
Error](https://rtdlm.github.io/TDLM/articles/TDLM.html#normalized-root-mean-square-error-nrmse)
(NRMSE), the [Kullback–Leibler
divergence](https://rtdlm.github.io/TDLM/articles/TDLM.html#kullbackleibler-divergence-ks)
(KL), and the Kolmogorov-Smirnov statistic and p-value (KS). These
measures are based on the observed and simulated flow distance
distributions and are computed using the
[ks_test](https://rdrr.io/pkg/Ecume/man/ks_test.html) function from the
[Ecume](https://cran.r-project.org/package=Ecume) package.

## Note

By default, if `sim` is an output of
[`run_law_model()`](https://rtdlm.github.io/TDLM/reference/run_law_model.md),
the measure(s) are computed only for the simulated OD matrices and not
for the `proba` matrix (included in the output when
`write_proba = TRUE`). The argument `use_proba` can be used to compute
the measure(s) based on the `proba` matrix instead of the simulated OD
matrix. In this case, the argument `obs` should also be a `proba`
matrix.

All inputs should be based on the same number of locations, sorted in
the same order. It is recommended to use the location ID as `matrix`
`rownames` and `matrix` `colnames` and to set `check_names = TRUE` to
verify that everything is consistent before running this function
(`check_names = FALSE` by default). Note that the function
[`check_format_names()`](https://rtdlm.github.io/TDLM/reference/check_format_names.md)
can be used to validate all inputs before running the main package's
functions.

## References

Lenormand M, Bassolas A, Ramasco JJ (2016) Systematic comparison of trip
distribution laws and models. *Journal of Transport Geography* 51,
158-169.

## See also

For more details illustrated with a practical example, see the vignette:
<https://rtdlm.github.io/TDLM/articles/TDLM.html#goodness-of-fit-measures>.

Associated functions:
[`run_law()`](https://rtdlm.github.io/TDLM/reference/run_law.md),
[`run_model()`](https://rtdlm.github.io/TDLM/reference/run_model.md),
[`run_law_model()`](https://rtdlm.github.io/TDLM/reference/run_law_model.md).

## Author

Maxime Lenormand (<maxime.lenormand@inrae.fr>)

## Examples

``` r
data(mass)
data(distance)
data(od)

mi <- as.numeric(mass[, 1])
mj <- mi
Oi <- as.numeric(mass[, 2])
Dj <- as.numeric(mass[, 3])

res <- run_law_model(law = "GravExp", 
                     mass_origin = mi, 
                     mass_destination = mj,
                     distance = distance, 
                     opportunity = NULL, 
                     param = 0.01,
                     model = "DCM", 
                     nb_trips = NULL, 
                     out_trips = Oi, 
                     in_trips = Dj,
                     average = FALSE, 
                     nbrep = 1, 
                     maxiter = 50, 
                     mindiff = 0.01,
                     write_proba = FALSE,
                     check_names = FALSE)

gof(sim = res, 
    obs = od, 
    measures = "CPC", 
    distance = NULL, 
    bin_size = 2,
    use_proba = FALSE,
    check_names = FALSE)
#>      Simulation       CPC
#> 1 replication_1 0.4572866
```
