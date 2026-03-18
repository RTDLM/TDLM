# Changelog

## TDLM 1.1.3.9000

This is a list of changes made in the development/GitHub version of the
package  
between TDLM 1.1.3 (CRAN release 2025-09-03) and the next CRAN release.

- Corrected an issue with `DCM`
  ([`run_law_model()`](https://rtdlm.github.io/TDLM/reference/run_law_model.md)
  and
  [`run_model()`](https://rtdlm.github.io/TDLM/reference/run_model.md))
  and the way it handles zeroes in pij. It was particularly problematic
  with `law = "Unif"`.

## TDLM 1.1.3

This is a list of changes made between TDLM 1.1.2 (CRAN release
2025-05-06) and  
TDLM 1.1.3 (CRAN release 2025-09-03).

- Corrected a minor issue with `ACM` when `average=TRUE` in
  [`run_law_model()`](https://rtdlm.github.io/TDLM/reference/run_law_model.md)
  and
  [`run_model()`](https://rtdlm.github.io/TDLM/reference/run_model.md).

- Added new French datasets for teaching purposes (`mass_mtp`,
  `distance_mtp`, `od_mtp` and `mtp`).

- Python version available: [PyTDLM](https://rtdlm.github.io/PyTDLM/).

## TDLM 1.1.2

This is a list of changes made between TDLM 1.1.2 (CRAN release
2025-03-06) and  
TDLM 1.1.2 (CRAN release 2025-05-06).

- Renamed the organization to `RTDLM`.

- Added the `great_circle` argument to
  [`extract_spatial_information()`](https://rtdlm.github.io/TDLM/reference/extract_spatial_information.md)
  allowing the users to use their own projection for computing Euclidean
  distances (suggested by
  [@PleaseConverge](https://github.com/PleaseConverge)).

- Changed the threshold of
  [`Ecume::ks_test()`](https://rdrr.io/pkg/Ecume/man/ks_test.html) used
  [here](https://github.com/RTDLM/TDLM/blob/master/R/utils.R#L764) from
  0.001 to 0 to match the standard definition of the Kolmogorov–Smirnov
  test (suggested by
  [@PleaseConverge](https://github.com/PleaseConverge)).

## TDLM 1.1.1

This is a list of changes made between TDLM 1.1.0 (CRAN release
2025-0107) and  
TDLM 1.1.1 (CRAN release 2025-03-06).

- Added error messages related to the Java dependency.

## TDLM 1.1.0

This is a list of changes made between TDLM 1.0.0 (CRAN release
2023-12-19) and  
TDLM 1.1.0 (CRAN release 2025-01-07).

- Added the function
  [`extract_distances()`](https://rtdlm.github.io/TDLM/reference/extract_distances.md)
  to compute distances from geographical coordinates.

- Updated `documentation` and `vignette`.

- Updated tests.

## TDLM 1.0.0

This is a list of changes made between TDLM 0.1.0 (CRAN release
2023-03-18) and  
TDLM 1.0.0 (CRAN release 2023-12-19).

- Added automated tests (`testthat` + `covr`).

- Fixed a bug in
  [`extract_spatial_information()`](https://rtdlm.github.io/TDLM/reference/extract_spatial_information.md)
  (reported by [@Pachka](https://github.com/Pachka),
  [\#1](https://github.com/RTDLM/TDLM/issues/1)).

- Optimized
  [`extract_spatial_information()`](https://rtdlm.github.io/TDLM/reference/extract_spatial_information.md)
  for significantly improved performance in distance computation (idea
  proposed by [@Pachka](https://github.com/Pachka)).

- Updated the method for identifying the package folder path in
  [`extract_opportunities()`](https://rtdlm.github.io/TDLM/reference/extract_opportunities.md),
  [`run_law_model()`](https://rtdlm.github.io/TDLM/reference/run_law_model.md),
  [`run_law()`](https://rtdlm.github.io/TDLM/reference/run_law.md), and
  [`run_model()`](https://rtdlm.github.io/TDLM/reference/run_model.md)
  (issue identified by [@Pachka](https://github.com/Pachka)).

## TDLM 0.1.0

First release on CRAN.
