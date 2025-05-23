% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_law.R
\name{run_law}
\alias{run_law}
\title{Estimate mobility flows based on different trip distribution laws}
\usage{
run_law(
  law = "Unif",
  mass_origin,
  mass_destination = mass_origin,
  distance = NULL,
  opportunity = NULL,
  param = NULL,
  check_names = FALSE
)
}
\arguments{
\item{law}{A \code{character} indicating which law to use (see Details).}

\item{mass_origin}{A \code{numeric} vector representing the mass at the origin (i.e.
demand).}

\item{mass_destination}{A \code{numeric} vector representing the mass at
the destination (i.e. attractiveness).}

\item{distance}{A squared \code{matrix} representing the distance between locations
(see Details).}

\item{opportunity}{A squared \code{matrix} representing the number of opportunities
between locations (see Details). Can be easily computed with
\code{\link[=extract_opportunities]{extract_opportunities()}}.}

\item{param}{A \code{numeric} vector or a single \code{numeric} value used to adjust
the importance of \code{distance} or \code{opportunity} associated with the chosen law.
Not necessary for the original radiation law or the uniform law (see
Details).}

\item{check_names}{A \code{boolean} indicating whether the location IDs used as
matrix rownames and colnames should be checked for consistency
(see Note).}
}
\value{
An object of class \code{TDLM}. An object of class \code{TDLM}. A \code{list} of \code{list} of
matrice containing for each parameter value the matrix of probabilities
(called \code{proba}). If \code{length(param) = 1} or \code{law = "Rad"} or \code{law = "Unif"}
only a list of matrices will be returned.
}
\description{
This function estimates mobility flows using different distribution laws
and models. As described in Lenormand \emph{et al.} (2016), the
function uses a two-step approach to generate mobility flows by separating
the trip distribution law (gravity or intervening opportunities) from the
modeling approach used to generate the flows based on this law. This function
only uses the first step to generate a probability distribution based on the
different laws.
}
\details{
We compute the matrix \code{proba} estimating the probability to observe a
trip from one location to another. This probability is based on the demand
(argument \code{mass_origin}) and the attractiveness (argument
\code{mass_destination}). Note that the population is typically used as a
surrogate for both quantities (this is why \code{mass_destination = mass_origin}
by default). It also depends on the distance between locations
(argument \code{distance}) OR the number of opportunities between locations
(argument \code{opportunity}) depending on the chosen law. Both the effect of the
distance and the number of opportunities can be adjusted with a parameter
(argument \code{param}) except for the original radiation law and the uniform law.

In this package we consider eight probabilistic laws described in details in
Lenormand \emph{et al.} (2016). Four
gravity laws (Barthelemy, 2011), three
intervening opportunity laws (Schneider, 1959; Simini \emph{et al.}, 2012;
Yang \emph{et al.}, 2014) and a uniform law.
\enumerate{
\item Gravity law with an exponential distance decay function
(\code{law = "GravExp"}). The arguments \code{mass_origin}, \code{mass_destination}
(optional), \code{distance} and \code{param} will be used.
\item Normalized gravity law with an exponential distance decay function
(\code{law = "NGravExp"}). The arguments \code{mass_origin}, \code{mass_destination}
(optional), \code{distance} and \code{param} will be used.
\item Gravity law with a power distance decay function
(\code{law = "GravPow"}). The arguments \code{mass_origin}, \code{mass_destination}
(optional), \code{distance} and \code{param} will be used.
\item Normalized gravity law with a power distance decay function
(\code{law = "NGravPow"}). The arguments \code{mass_origin}, \code{mass_destination}
(optional), \code{distance} and \code{param} will be used.
\item Schneider's intervening opportunities law (\code{law = "Schneider"}). The
arguments \code{mass_origin}, \code{mass_destination} (optional), \code{opportunity} and
\code{param} will be used.
\item Radiation law (\code{law = "Rad"}). The arguments \code{mass_origin},
\code{mass_destination} (optional) and \code{opportunity} will be used.
\item Extended radiation law (\code{law = "RadExt"}). The arguments \code{mass_origin},
\code{mass_destination} (optional), \code{opportunity} and \code{param} will be used.
\item Uniform law (\code{law = "Unif"}). The argument \code{mass_origin} will be used to
extract the number of locations.
}
}
\note{
All inputs should be based on the same number of
locations, sorted in the same order. It is recommended to use the location ID
as \code{matrix} \code{rownames} and \code{matrix} \code{colnames} and to set
\code{check_names = TRUE} to verify that everything is consistent before running
this function (\code{check_names = FALSE} by default). Note that the function
\code{\link[=check_format_names]{check_format_names()}} can be used to validate all inputs
before running the main package's functions.
}
\examples{
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

}
\references{
Barthelemy M (2011). Spatial Networks. \emph{Physics Reports} 499, 1-101.

Lenormand M, Bassolas A, Ramasco JJ (2016) Systematic comparison of trip
distribution laws and models. \emph{Journal of Transport Geography} 51,
158-169.

Schneider M (1959) Gravity models and trip distribution theory. \emph{Papers
of the regional science association} 5, 51-58.

Simini F, González MC, Maritan A & Barabási A (2012) A universal model for
mobility and migration patterns. \emph{Nature} 484, 96-100.

Yang Y, Herrera C, Eagle N & González MC (2014) Limits of Predictability in
Commuting Flows in the Absence of Data for Calibration. \emph{Scientific
Reports} 4, 5662.
}
\seealso{
For more details illustrated with a practical example,
see the vignette:
\url{https://rtdlm.github.io/TDLM/articles/TDLM.html#run-functions}.

Associated functions:
\code{\link[=run_law_model]{run_law_model()}}, \code{\link[=run_model]{run_model()}}, \code{\link[=gof]{gof()}}.
}
\author{
Maxime Lenormand (\email{maxime.lenormand@inrae.fr})
}
