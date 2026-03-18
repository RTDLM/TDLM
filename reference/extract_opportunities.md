# Compute the number of opportunities between pairs of locations

This function computes the number of opportunities between pairs of
locations as defined in Lenormand *et al.* (2016). For a given pair of
locations, the number of opportunities between the origin location and
the destination location is based on the number of opportunities within
a circle of radius equal to the distance between the origin and the
destination, with the origin location as the center. The number of
opportunities at the origin and destination locations are not included.

## Usage

``` r
extract_opportunities(opportunity, distance, check_names = FALSE)
```

## Arguments

- opportunity:

  A `numeric` vector representing the number of opportunities per
  location. The value should be positive.

- distance:

  A squared `matrix` representing the distances between locations.

- check_names:

  A `boolean` indicating whether the location IDs are used as `vector`
  names, `matrix` row names, and `matrix` column names, and whether they
  should be checked (see Note).

## Value

A squared `matrix` in which each element represents the number of
opportunities between a pair of locations.

## Note

`opportunity` and `distance` should be based on the same number of
locations sorted in the same order. It is recommended to use the
location ID as `matrix` `rownames` and `matrix` `colnames` and to set
`check_names = TRUE` to verify that everything is consistent before
running this function (`check_names = FALSE` by default). Note that the
function
[`check_format_names()`](https://rtdlm.github.io/TDLM/reference/check_format_names.md)
can be used to validate all inputs before running the main package's
functions.

## References

Lenormand M, Bassolas A, Ramasco JJ (2016) Systematic comparison of trip
distribution laws and models. *Journal of Transport Geography* 51,
158-169.

## See also

Associated functions:
[`extract_distances()`](https://rtdlm.github.io/TDLM/reference/extract_distances.md),
[`extract_spatial_information()`](https://rtdlm.github.io/TDLM/reference/extract_spatial_information.md).

## Author

Maxime Lenormand (<maxime.lenormand@inrae.fr>)

## Examples

``` r
data(mass)
data(distance)

opportunity <- mass[, 1]

sij <- extract_opportunities(opportunity = opportunity,
                             distance = distance,
                             check_names = FALSE)
```
