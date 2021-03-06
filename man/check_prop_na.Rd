% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/na_checks.R
\name{check_prop_na}
\alias{check_prop_na}
\title{Check the proportion of missing values}
\usage{
check_prop_na(x, prop, strict = FALSE)
}
\arguments{
\item{x}{Vector to check the proportion of missing values in.}

\item{prop}{The threshold as a proportion (0 to 1) for missing values in
\code{x}.}

\item{strict}{A logical (default \code{FALSE}) indicating if the proportion
of missing values must be \strong{strictly} less than \code{prop}
(\code{strict = TRUE}) or only less than \code{prop_na} (\code{strict =
FALSE}).}
}
\value{
\code{TRUE} if the proportion of missing values in \code{x} is less
  than (or strictly less than if \code{strict = TRUE}) \code{prop}, and
  \code{FALSE} otherwise.
}
\description{
\code{check_prop_na} returns \code{TRUE} if the proportion of missing values
is below a given threshold. This is a convenient wrapper function for
\code{prop_na(x) < prop} or \code{prop_na(x) <= prop} (depending on
\code{strict}).
}
\details{
If \code{strict = FALSE} (the default), \code{check_prop_na} is equivalent to
\code{prop_na(x) <= prop} i.e. it returns \code{TRUE} if the proportion of
missing values in \code{x} is less than or equal to \code{prop_na}, and
\code{FALSE} otherwise.

If \code{strict = TRUE}, \code{check_prop_na} is equivalent to
\code{prop_na(x) < prop} i.e. the same as above but with a strictly less than
\code{prop} condition.
}
\examples{
check_prop_na(c(1, 2, NA, 4), 0.6)
check_prop_na(c(1, 2, NA, 4), 0.4)

check_prop_na(c(1:10, NA), 0.1)

check_prop_na(c(1:9, NA), 0.1, strict = TRUE)
}
