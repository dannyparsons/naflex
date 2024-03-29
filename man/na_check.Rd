% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/na_check.R
\name{na_check}
\alias{na_check}
\title{Check missing values conditions}
\usage{
na_check(
  x,
  prop = NULL,
  n = NULL,
  consec = NULL,
  n_non = NULL,
  prop_strict = FALSE
)
}
\arguments{
\item{x}{Vector to check the missing values properties of.}

\item{prop}{The maximum proportion (0 to 1) of missing values allowed.}

\item{n}{The maximum number of missing values allowed.}

\item{consec}{The maximum number of consecutive missing values allowed.}

\item{n_non}{The minimum number of \strong{non-missing} values required.}

\item{prop_strict}{A logical (default \code{FALSE}) indicating if the
proportion of missing values must be \strong{strictly} less than
\code{prop} (\code{prop_strict = TRUE}) or only less than \code{prop}
(\code{prop_strict = FALSE}).}
}
\value{
\code{TRUE} if all specified checks pass, and \code{FALSE} otherwise.
}
\description{
\code{na_check} checks conditions on missing values in a vector. If all the
checks pass it returns \code{TRUE}, otherwise \code{FALSE}.
}
\details{
There are four type of checks available:
\itemize{
\item a maximum proportion of missing values allowed (\code{prop})
\item a maximum number of missing values allowed (\code{n})
\item a maximum number of consecutive missing values allowed (\code{consec}),
and
\item a minimum number of non-missing values required (\code{n_non}).
}

Any number of checks may be specified, including none. If multiple checks are
specified, they must all pass in order to return \code{TRUE}.
If no checks are specified then \code{TRUE} is returned, since
this is considered as "all" checks passing.
}
\examples{
x <- c(1:3, NA, NA, NA, 4, NA, NA, 3)
# check if no more than 50\% of values are missing
na_check(x, prop = 0.5)
# check if no more than 50\% of values are missing
# and if there are no more than 2 consecutive missing values.
na_check(x, prop = 0.5, consec = 2)
}
