# Automatic calibration of trip distribution laws' parameter

This function returns an estimate of the optimal parameter value based
on the average surface area of the locations (in square kilometers)
according to the law. This estimation has only been tested on commuting
data (in kilometers).

## Usage

``` r
calib_param(av_surf, law = "NGravExp")
```

## Arguments

- av_surf:

  A positive `numeric` value indicating the average surface area of the
  locations (in square kilometers).

- law:

  A `character` string indicating which law to use (see Details).

## Value

An estimate of the optimal parameter value based on the average surface
area of the locations.

## Details

The estimation is based on Figure 8 in Lenormand *et al.* (2016) for
four types of laws: the normalized gravity law with an exponential
distance decay function (`law = "NGravExp"`), the normalized gravity law
with a power distance decay function (`law = "NGravPow"`), Schneider's
intervening opportunities law (`law = "Schneider"`), and the extended
radiation law (`law = "RadExt"`).

## References

Lenormand M, Bassolas A, Ramasco JJ (2016) Systematic comparison of trip
distribution laws and models. *Journal of Transport Geography* 51,
158-169.

## See also

Associated functions:
[`extract_opportunities()`](https://rtdlm.github.io/TDLM/reference/extract_opportunities.md)
[`extract_spatial_information()`](https://rtdlm.github.io/TDLM/reference/extract_spatial_information.md)
[`check_format_names()`](https://rtdlm.github.io/TDLM/reference/check_format_names.md)

## Author

Maxime Lenormand (<maxime.lenormand@inrae.fr>)

## Examples

``` r
data(county)

res <- extract_spatial_information(county, id = "ID")
av_surf <- mean(res$surface)

calib_param(av_surf = av_surf, law = "NGravExp")
#> [1] 0.08521097
calib_param(av_surf = av_surf, law = "NGravPow")
#> [1] 3.295941
calib_param(av_surf = av_surf, law = "Schneider")
#> [1] 2.475339e-06
calib_param(av_surf = av_surf, law = "RadExt")
#> [1] 1.299361
```
