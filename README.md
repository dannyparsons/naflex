
<!-- README.md is generated from README.Rmd. Please edit that file -->

# naflex: Flexible options for missing values

<!-- badges: start -->

[![Travis Build
Status](https://travis-ci.org/dannyparsons/naflex.svg?branch=master)](https://travis-ci.org/dannyparsons/naflex)
<!-- badges: end -->

The `naflex` R package provides greater flexibility for dealing with
missing values than the `na.rm = TRUE/FALSE` option available in most
summary functions in R.

Most summary functions in R e.g. `mean`, provide the option for the two
extremes: - calculate the summary ignoring all missing values, `na.rm =
TRUE`, or - require no missing values for the summary to be calculated,
`na.rm = FALSE`

In many applications something in between these two extremes is often
appropriate. For example, you may wish to give a summary statistic if
less than `10%` of values are missing. The World Meteorological
Organization (WMO) Guidelines on the Calculation of Climate
Normals<sup id="a1">[1](#f1)</sup> recommends that a monthly mean value
calculated from daily values should be calculated as long as there are
no more than `10` missing values and no more than `4` consecutive
missing values in the month.

`naflex` provides helper functions to facilitate this flexibility for
dealing with missing values.

In particular `naflex` provides four types of missing value checks: - a
maximum proportion of missing values allowed - a maximum number of
missing values allowed - a maximum number of consecutive missing values
allowed, and - a minimum number of non-missing values required.

# References

<sup id="f1">1</sup>
<a href="https://library.wmo.int/index.php?lvl=notice_display&id=20130#.XljKS84zZnI">WMO
Guidelines on the Calculation of Climate Normals</a> [↩](#a1)
