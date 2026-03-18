# Estimate mobility flows based on different trip distribution laws

This function estimates mobility flows using different distribution laws
and models. As described in Lenormand *et al.* (2016), the function uses
a two-step approach to generate mobility flows by separating the trip
distribution law (gravity or intervening opportunities) from the
modeling approach used to generate the flows based on this law. This
function only uses the first step to generate a probability distribution
based on the different laws.

## Usage

``` r
run_law(
  law = "Unif",
  mass_origin,
  mass_destination = mass_origin,
  distance = NULL,
  opportunity = NULL,
  param = NULL,
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

- check_names:

  A `boolean` indicating whether the location IDs used as matrix
  rownames and colnames should be checked for consistency (see Note).

## Value

An object of class `TDLM`. An object of class `TDLM`. A `list` of `list`
of matrice containing for each parameter value the matrix of
probabilities (called `proba`). If `length(param) = 1` or `law = "Rad"`
or `law = "Unif"` only a list of matrices will be returned.

## Details

We compute the matrix `proba` estimating the probability to observe a
trip from one location to another. This probability is based on the
demand (argument `mass_origin`) and the attractiveness (argument
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
[`run_law_model()`](https://rtdlm.github.io/TDLM/reference/run_law_model.md),
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

res <- run_law(
  law = "GravExp", mass_origin = mi, mass_destination = mj,
  distance = distance, opportunity = NULL, param = 0.01,
  check_names = FALSE
)

# print(res)
```
