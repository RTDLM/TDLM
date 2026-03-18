# Extract distances and surface areas from a spatial object

This function returns a `matrix` of distances between locations (in
kilometers) along with a vector of surface areas for the locations (in
square kilometers).

## Usage

``` r
extract_spatial_information(
  geometry,
  id = NULL,
  great_circle = FALSE,
  show_progress = FALSE
)
```

## Arguments

- geometry:

  A spatial object that can be handled by the `sf` package.

- id:

  The name or number of the column to use as `rownames` and `colnames`
  for the output distance `matrix` (optional, `NULL` by default). A
  `vector` with a length equal to the number of locations can also be
  used.

- great_circle:

  A `boolean` indicating whether distances and surface areas should be
  computed using longitude/latitude coordinates (see Details).

- show_progress:

  A `boolean` indicating whether a progress bar should be displayed.

## Value

A `list` composed of two elements. The first element is a square
`matrix` representing the great-circle distances (in kilometers) between
locations. The second element is a vector containing the surface area of
each location (in square kilometers).

## Details

The `geometry` must be projected in a valid coordinate reference system
(CRS). By default, if `great_circle = TRUE`, the coordinates will be
reprojected in degrees longitude/latitude to compute great-circle
distances between centroids using an internal function, and surface
areas will be calculated using
[`sf::st_area()`](https://r-spatial.github.io/sf/reference/geos_measures.html).
If `great_circle = FALSE`, the coordinates are assumed to be planar
(e.g., in meters) and Euclidean distances will be used.

## Note

The outputs are based on the locations contained in `geometry` and
sorted in the same order. An optional `id` can also be provided to be
used as names for the outputs.

## See also

Associated functions:
[`extract_distances()`](https://rtdlm.github.io/TDLM/reference/extract_distances.md)
[`extract_opportunities()`](https://rtdlm.github.io/TDLM/reference/extract_opportunities.md)

## Author

Maxime Lenormand (<maxime.lenormand@inrae.fr>)

## Examples

``` r
data(county)

res <- extract_spatial_information(county, id = "ID")

dim(res$distance)
#> [1] 105 105

length(res$surface)
#> [1] 105
```
