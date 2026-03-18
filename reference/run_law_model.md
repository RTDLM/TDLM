# Estimate mobility flows based on different trip distribution laws and models

This function estimates mobility flows using different distribution laws
and models. As described in Lenormand *et al.* (2016), the function uses
a two-step approach to generate mobility flows by separating the trip
distribution law (gravity or intervening opportunities) from the
modeling approach used to generate the flows based on this law.

## Usage

``` r
run_law_model(
  law = "Unif",
  mass_origin,
  mass_destination = mass_origin,
  distance = NULL,
  opportunity = NULL,
  param = NULL,
  model = "UM",
  nb_trips = 1000,
  out_trips = NULL,
  in_trips = out_trips,
  average = FALSE,
  nbrep = 3,
  maxiter = 50,
  mindiff = 0.01,
  write_proba = FALSE,
  check_names = FALSE
)
```

## Arguments

- law:

  A `character` indicating which law to use (see Details).

- mass_origin:

  A `numeric` vector representing the mass at the origin (i.e. demand).

- mass_destination:

  A `numeric` vector representing the mass at the destination (i.e.
  attractiveness).

- distance:

  A squared `matrix` representing the distance between locations (see
  Details).

- opportunity:

  A squared `matrix` representing the number of opportunities between
  locations (see Details). Can be easily computed with
  [`extract_opportunities()`](https://rtdlm.github.io/TDLM/reference/extract_opportunities.md).

- param:

  A `numeric` vector or a single `numeric` value used to adjust the
  importance of `distance` or `opportunity` associated with the chosen
  law. Not necessary for the original radiation law or the uniform law
  (see Details).

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

- write_proba:

  A `boolean` indicating if the estimation of the probability to move
  from one location to another obtained with the distribution law should
  be returned along with the flow estimations.

- check_names:

  A `boolean` indicating whether the location IDs used as matrix
  rownames and colnames should be checked for consistency (see Note).

## Value

An object of class `TDLM`. A `list` of `list` of matrices containing for
each parameter value the `nbrep` simulated matrices and the matrix of
probabilities (called `proba`) if `write_proba = TRUE`. If
`length(param) = 1` or `law = "Rad"` or `law = "Unif"` only a list of
matrices will be returned.

## Details

First, we compute the matrix `proba` estimating the probability to
observe a trip from one location to another. This probability is based
on the demand (argument `mass_origin`) and the attractiveness (argument
`mass_destination`). Note that the population is typically used as a
surrogate for both quantities (this is why
`mass_destination = mass_origin` by default). It also depends on the
distance between locations (argument `distance`) OR the number of
opportunities between locations (argument `opportunity`) depending on
the chosen law. Both the effect of the distance and the number of
opportunities can be adjusted with a parameter (argument `param`) except
for the original radiation law and the uniform law.

In this package we consider eight probabilistic laws described in
details in Lenormand *et al.* (2016). Four gravity laws (Barthelemy,
2011), three intervening opportunity laws (Schneider, 1959; Simini *et
al.*, 2012; Yang *et al.*, 2014) and a uniform law.

1.  Gravity law with an exponential distance decay function
    (`law = "GravExp"`). The arguments `mass_origin`, `mass_destination`
    (optional), `distance` and `param` will be used.

2.  Normalized gravity law with an exponential distance decay function
    (`law = "NGravExp"`). The arguments `mass_origin`,
    `mass_destination` (optional), `distance` and `param` will be used.

3.  Gravity law with a power distance decay function
    (`law = "GravPow"`). The arguments `mass_origin`, `mass_destination`
    (optional), `distance` and `param` will be used.

4.  Normalized gravity law with a power distance decay function
    (`law = "NGravPow"`). The arguments `mass_origin`,
    `mass_destination` (optional), `distance` and `param` will be used.

5.  Schneider's intervening opportunities law (`law = "Schneider"`). The
    arguments `mass_origin`, `mass_destination` (optional),
    `opportunity` and `param` will be used.

6.  Radiation law (`law = "Rad"`). The arguments `mass_origin`,
    `mass_destination` (optional) and `opportunity` will be used.

7.  Extended radiation law (`law = "RadExt"`). The arguments
    `mass_origin`, `mass_destination` (optional), `opportunity` and
    `param` will be used.

8.  Uniform law (`law = "Unif"`). The argument `mass_origin` will be
    used to extract the number of locations.

Second, we propose four constrained models to generate the flows from
these distribution of probability as described in Lenromand *et al.*
(2016). These models respect different level of constraints. These
constraints can preserve the total number of trips (argument `nb_trips`)
OR the number of out-going trips (argument `out_trips`) AND/OR the
number of in-coming (argument `in_trips`) according to the model. The
sum of out-going trips should be equal to the sum of in-coming trips.

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

Barthelemy M (2011). Spatial Networks. *Physics Reports* 499, 1-101.

Deming WE & Stephan FF (1940) On a Least Squares Adjustment of a Sample
Frequency Table When the Expected Marginal Totals Are Known. *Annals of
Mathematical Statistics* 11, 427-444.

Lenormand M, Bassolas A, Ramasco JJ (2016) Systematic comparison of trip
distribution laws and models. *Journal of Transport Geography* 51,
158-169.

Schneider M (1959) Gravity models and trip distribution theory. *Papers
of the regional science association* 5, 51-58.

Simini F, González MC, Maritan A & Barabási A (2012) A universal model
for mobility and migration patterns. *Nature* 484, 96-100.

Yang Y, Herrera C, Eagle N & González MC (2014) Limits of Predictability
in Commuting Flows in the Absence of Data for Calibration. *Scientific
Reports* 4, 5662.

## See also

For more details illustrated with a practical example, see the vignette:
<https://rtdlm.github.io/TDLM/articles/TDLM.html#run-functions>.

Associated functions:
[`run_law()`](https://rtdlm.github.io/TDLM/reference/run_law.md),
[`run_model()`](https://rtdlm.github.io/TDLM/reference/run_model.md),
[`gof()`](https://rtdlm.github.io/TDLM/reference/gof.md).

## Author

Maxime Lenormand (<maxime.lenormand@inrae.fr>)

## Examples

``` r
data(mass)
data(distance)

mi <- as.numeric(mass[, 1])
mj <- mi
N <- 1000

res <- run_law_model(law = "GravExp",
                     mass_origin = mi, 
                     mass_destination = mj,
                     distance = distance, 
                     opportunity = NULL, 
                     param = 0.01,
                     model = "UM", 
                     nb_trips = N,
                     out_trips = NULL, 
                     in_trips = NULL,
                     average = TRUE, 
                     nbrep = 2, 
                     maxiter = 50, 
                     mindiff = 0.01,
                     write_proba = FALSE,
                     check_names = FALSE)

print(res)
#>        Argument       Value
#> 1           Law     GravExp
#> 2         Model          UM
#> 3 #Replications 1 (average)
#> 4   #Parameters           1
#> 5     Parameter        0.01
```
