#' Population and number of out- and in-commuters in Kansas counties, USA (2000)
#'
#' A dataset containing the number of inhabitants, in-commuters, and out-commuters
#' for 105 Kansas counties in 2000.
#'
#' @format A `data.frame` with 105 rows and 4 columns:
#' \describe{
#'   \item{rownames}{County ID.}
#'   \item{Population}{Number of inhabitants.}
#'   \item{Out_Commuters}{Number of out-commuters.}
#'   \item{In_Commuters}{Number of in-commuters.}
#' }
#' @source <https://www2.census.gov/programs-surveys/decennial/tables/2000/county-to-county-worker-flow-files/>
"mass"

#' Great-circle distances between Kansas counties, USA
#'
#' A dataset containing the great-circle distance (in kilometers) between 105
#' Kansas counties.
#'
#' @format A `matrix` with 105 rows and 105 columns. Each element represents the
#' distance between two counties. County IDs are used as row and column names.
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/carto-boundary-file.html>
"distance"

#' Origin-Destination commuting matrix for Kansas counties, USA (2000)
#'
#' A dataset containing the number of commuters between 105 Kansas counties in
#' 2000.
#'
#' @format A `matrix` with 105 rows and 105 columns. Each element represents the
#' number of commuters between two counties. County IDs are used as row and
#' column names.
#' @source <https://www2.census.gov/programs-surveys/decennial/tables/2000/
#' county-to-county-worker-flow-files/>
"od"

#' Spatial distribution of Kansas counties, USA (2000)
#'
#' A dataset containing the geometry of 105 Kansas counties.
#'
#' @format
#' \describe{
#'   \item{ID}{County ID.}
#'   \item{Longitude}{Longitude coordinate of the county centroid.}
#'   \item{Latitude}{Latitude coordinate of the county centroid.}
#'   \item{Area}{Surface area of the county (in square kilometers).}
#'   \item{geometry}{Geometry of the county.}
#' }
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/carto-boundary-file.html>
"county"

#' Geographical coordinates of Kansas counties' centroids (Longitude/Latitude, 2000)
#'
#' A dataset containing the geographical coordinates of Kansas counties' centroids.
#'
#' @format
#' \describe{
#'   \item{Longitude}{Longitude coordinate of the county centroid.}
#'   \item{Latitude}{Latitude coordinate of the county centroid.}
#' }
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/carto-boundary-file.html>
"coords"

#' Geographical coordinates of Kansas counties' centroids (X/Y, Web Mercator, 2000)
#'
#' A dataset containing the geographical coordinates of Kansas counties' centroids
#' in Web Mercator projection.
#'
#' @format
#' \describe{
#'   \item{X}{X coordinate of the county centroid.}
#'   \item{Y}{Y coordinate of the county centroid.}
#' }
#' @source <https://www.census.gov/geographies/mapping-files/time-series/geo/carto-boundary-file.html>
"coords_xy"

#' Population and number of out- and in-commuters in Hérault municipalities, France (2020)
#'
#' A dataset containing the number of inhabitants, in-commuters, and out-commuters
#' for 342 Hérault municipalities in 2020.
#'
#' @format A `data.frame` with 342 rows and 4 columns:
#' \describe{
#'   \item{rownames}{Municipality ID.}
#'   \item{Population}{Number of inhabitants.}
#'   \item{Out_Commuters}{Number of out-commuters.}
#'   \item{In_Commuters}{Number of in-commuters.}
#' }
#' @source <https://www.insee.fr/fr/statistiques/7630376>
#' @keywords internal
"mass_mtp"

#' Great-circle distances between Hérault municipalities, France
#'
#' A dataset containing the great-circle distance (in kilometers) between 342
#' Hérault municipalities.
#'
#' @format A `matrix` with 342 rows and 342 columns. Each element represents the
#' distance between two municipalities. Municipality IDs are used as row and
#' column names.
#' @source <https://www.data.gouv.fr/datasets/contours-communes-france-administrative-format-admin-express-avec-arrondissements/>
#' @keywords internal
"distance_mtp"

#' Origin-Destination commuting matrix for Hérault municipalities, France (2020)
#'
#' A dataset containing the number of commuters between 342 Hérault municipalities
#' in 2020.
#'
#' @format A `matrix` with 342 rows and 342 columns. Each element represents the
#' number of commuters between two municipalities. Municipality IDs are used as
#' row and column names.
#' @source <https://www.insee.fr/fr/statistiques/7630376>
#' @keywords internal
"od_mtp"

#' Spatial distribution of Hérault municipalities, France (2020)
#'
#' A dataset containing the geometry of 342 Hérault municipalities.
#'
#' @format
#' \describe{
#'   \item{ID}{Municipality ID.}
#'   \item{Longitude}{Longitude coordinate of the municipality centroid.}
#'   \item{Latitude}{Latitude coordinate of the municipality centroid.}
#'   \item{Area}{Surface area of the municipality (in square kilometers).}
#'   \item{geometry}{Geometry of the municipality.}
#' }
#' @source <https://www.data.gouv.fr/datasets/contours-communes-france-administrative-format-admin-express-avec-arrondissements/>
#' @keywords internal
"mtp"
