# **TDLM**

# Systematic comparison of trip distribution laws and models

## 1 Short description

The main purpose of these packages is to provide a rigorous framework
for fairly comparing trip distribution laws and models, as described in
[Lenormand *et al.*
(2016)](https://doi.org/10.1016/j.jtrangeo.2015.12.008). This general
framework relies on a two-step approach to generate mobility flows,
separating the trip distribution law, gravity or intervening
opportunities, from the modeling approach used to derive flows from this
law.

To make this framework more accessible, we developed both an [R
package](https://rtdlm.github.io/TDLM/) and a [Python
package](https://rtdlm.github.io/PyTDLM/), which replace the original
[Java
scripts](https://github.com/maximelenormand/Trip-distribution-laws-and-models)
and extend their functionality.

This implementation provides the framework directly in R, making it easy
to integrate with existing workflows and statistical tools commonly used
by the R community.

## 2 Install

The `TDLM` package can be installed with the following command in an R
session:

From the CRAN

``` r
install.packages("TDLM")
```

or from GitHub

``` r
# install.packages("devtools")
devtools::install_github("RTDLM/TDLM", build_vignettes = TRUE)
```

## 3 Tutorial

A tutorial vignette is available
[here](https://rtdlm.github.io/TDLM/articles/TDLM.html).

## 4 Dependencies

`TDLM` depends on the following packages: `Ecume`, `mathjaxr`, `Rdpack`,
`readr`, `rmarkdown`, and `sf`.

Additionally, `TDLM` requires Java to function properly. Please ensure
that Java is installed and correctly configured on your system.

## 5 Citation

Lenormand M (2023) [TDLM: An R package for a systematic comparison of
trip distribution laws and
models.](https://joss.theoj.org/papers/10.21105/joss.05434#) *Journal of
Open Source Software* 8, 5434.

Please feel free to open an issue if you encounter a problem with the
package.
