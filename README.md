
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
x <- rnorm(10)
sparkbars(x)
#> ▂▄    ▄▆  
#>   [7m▅[27m[7m▆[27m[7m▂[27m[7m▇[27m  [7m▃[27m[7m▂[27m
```

Inline:

. Looks bad
