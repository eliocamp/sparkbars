
<!-- README.md is generated from README.Rmd. Please edit that file -->
sparkbars
=========

A purposedly simple implementation of sparkbars that can plot negative and positive values.

Installation
------------

sparkbars is not con CRAN yet, but you can install the developement version from GitHub with:

``` r
remotes::install_github("eliocamp/sparkbars")
```

Example
-------

``` r
library(sparkbars)
set.seed(1)
x <- rnorm(10)
sparkbars(x, color = TRUE)
#>  ▂ ▇▂ ▃▄▃ 
#> ▆ ▅  ▅   ▇
```

Doesn't work with knitr.

Inline:

\[7m▆\[27m, ▂, \[7m▅\[27m, ▇, ▂, \[7m▅\[27m, ▃, ▄, ▃, \[7m▇\[27m

Looks horrible
