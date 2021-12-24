
<!-- README.md is generated from README.Rmd. Please edit that file -->

# naflex: Flexible options for handling missing values

<!-- badges: start -->

[![R-CMD-check](https://github.com/dannyparsons/naflex/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/dannyparsons/naflex/actions/workflows/R-CMD-check.yaml)
[![codecov](https://codecov.io/gh/dannyparsons/naflex/branch/master/graph/badge.svg?token=MSQKXE5UYR)](https://codecov.io/gh/dannyparsons/naflex)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/naflex)](https://cran.r-project.org/package=naflex)
[![license](https://img.shields.io/badge/license-LGPL%20(%3E=%203)-lightgrey.svg)](https://choosealicense.com/)
<!-- badges: end -->

The `naflex` R package provides additional flexibility for handling
missing values in summary functions beyond the existing () options
available in base R.

Most summary functions in base R e.g. `mean`, provide the two extreme
options for handling missing values:

1.  calculate the summary ignoring all missing values (`na.rm = TRUE`),
    or
2.  require no missing values for the summary to be calculated (na.rm =
    FALSE\`)

In many cases, something in between these two extremes is often more
appropriate. For example, you may wish to give a summary statistic if
less than `5%` of values are missing.

`naflex` provides helper functions to facilitate this flexibility. It
allows for omitting missing values conditionally, using four types of
requirements: - a maximum proportion of missing values allowed - a
maximum number of missing values allowed - a maximum number of
consecutive missing values allowed, and - a minimum number of
non-missing values required.

## Installation

``` r
# Install the development version from GitHub:
# install.packages("devtools")
devtools::install_github("dannyparsons/naflex")
```

## Usage

The main function in `naflex` is `na_omit_if`.

When wrapped around a vector in a summary function, `na_omit_if` ensures
that the summary value is calculated when the checks pass, and returns
`NA` if not. The example below shows how to calculate the `mean`
conditionally on the proportion of missing values.

``` r
library(naflex)

x <- c(1, 3, NA, NA, 3, 2, NA, 5, 8, 7)

# Calculate if 4 or less missing values
mean(na_omit_if(x, prop = 0.3))
#> [1] 4.142857
# Calculate if 2 or less missing values
mean(na_omit_if(x, prop = 0.2))
#> [1] NA
```

Four types of checks are available:

-   `prop`: the maximum proportion (0 to 1) of missing values allowed
-   `n`: the maximum number of missing values allowed
-   `consec`: the maximum number of consecutive missing values allowed,
    and
-   `n_non`: the minimum number of non-missing values **required**.

If multiple checks are specified, all checks must pass for missing
values to be removed. For example, the code below returns `NA`. Although
there are less than 4 missing values in `x`, there are two consecutive
missing values, hence the `consec = 1` check fails.

``` r
mean(na_omit_if(x, n = 4, consec = 1))
#> [1] NA
```

Note that you cannot use this option with `na.rm = TRUE` in the summary
function since this will always remove missing values so the checks are
essentially ignored.

## Details & How `naflex` works

`na_omit_if` works by removing the missing values from `x` if the checks
pass, and leaving `x` unmodified otherwise.

``` r
# Missing values removed
na_omit_if(x, n = 4)
#> [1] 1 3 3 2 5 8 7
#> attr(,"na.action")
#> [1] 3 4 7
#> attr(,"class")
#> [1] "omit"
```

If missing values are removed, an `na.action` attribute and `omit` class
is added for consistency with `stats::na.omit`.

``` r
# Missing values not removed
na_omit_if(x, n = 2)
#>  [1]  1  3 NA NA  3  2 NA  5  8  7
```

A set of four `na_omit_if_*` functions are provided for doing the same
thing restricted to a single check e.g. `na_omit_if_n(x, 2)`

`na_check` has the same parameters as `na_omit_if` but returns a logical
indicating whether the checks pass. It is used internally in
`na_omit_if` but may also be a useful helper function.

``` r
if (na_check(x, n = 4, consec = 1)) print("NA checks pass") else ("NA checks fail")
#> [1] "NA checks fail"
```

A set a four `na_check_*` functions are also provided for doing the same
thing restricted to a single check e.g. `na_check_prop(x, 0.2)`

Finally, `naflex` provides a set of helper functions for calculating
missing value properties used in these checks.

``` r
na_prop(x)
#> [1] 0.3
na_n(x)
#> [1] 3
na_consec(x)
#> [1] 2
na_non_na(x)
#> [1] 7
```

## Compared to base R

You can do this by first calculating the proportion of missing values
and then using `na.rm = TRUE` as appropriate. `naflex` aims to simplify
this process.

## Relevance to applications

The World Meteorological Organization (WMO) Guidelines on the
Calculation of Climate Normals<sup id="a1">[1](#f1)</sup> recommends
that a monthly mean value calculated from daily values should be
calculated as long as there are no more than `10` missing values and no
more than `4` consecutive missing values in the month.

# References

<sup id="f1">1</sup>
<a href="https://library.wmo.int/index.php?lvl=notice_display&id=20130#.XljKS84zZnI">WMO
Guidelines on the Calculation of Climate Normals</a> [↩](#a1)
