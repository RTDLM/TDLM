# Compute the distance between pairs of locations

This function computes the distance between pairs of locations based on
geographical coordinates.

## Usage

``` r
extract_distances(
  coords,
  method = "Haversine",
  id = NULL,
  show_progress = FALSE
)
```

## Arguments

- coords:

  A two-column `matrix` or `data.frame` where each row represents the
  coordinates of a location (see Details).

- method:

  A `character` string indicating which method to choose to compute the
  distances (see Details). Available options are `"Haversine"` or
  `"Euclidean"`.

- id:

  A vector with length equal to the number of locations, used as row
  names and column names for the output distance matrix (optional,
  `NULL` by default).

- show_progress:

  A boolean indicating whether a progress bar should be displayed.

## Value

A square matrix representing the distance (in kilometers) between
locations.

## Details

`coords` must contain two columns: the first one for the longitude or
"X" coordinates, and the second one for the latitude or "Y" coordinates.
The `"Haversine"` method is used to compute great-circle distances from
longitude/latitude, while the `"Euclidean"` method should be used for
"X/Y" coordinates.

## Note

The outputs are based on the locations contained in `coords`, sorted in
the same order. An optional `id` can also be provided to be used as
names for the outputs.

## See also

Associated functions:
[extract_opportunities()](https://rtdlm.github.io/TDLM/reference/extract_spatial_information.md)

## Author

Maxime Lenormand (<maxime.lenormand@inrae.fr>)

## Examples

``` r
data(coords)

distance <- extract_distances(coords = coords, 
                              method = "Haversine",
                              id = rownames(coords))
```
