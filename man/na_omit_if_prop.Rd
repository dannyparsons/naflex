% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/na_omit_if-individuals.R
\name{na_omit_if_prop}
\alias{na_omit_if_prop}
\alias{na_omit_if_n}
\alias{na_omit_if_consec}
\alias{na_omit_if_non_na}
\title{Conditionally omit missing values (single condition)}
\usage{
na_omit_if_prop(x, prop = NULL, strict = FALSE)

na_omit_if_n(x, n = NULL)

na_omit_if_consec(x, consec = NULL)

na_omit_if_non_na(x, n_non = NULL)
}
\arguments{
\item{x}{Vector to omit missing values in if checks pass.}

\item{prop}{The maximum proportion (0 to 1) of missing values allowed.}

\item{strict}{A logical (default \code{FALSE}) indicating if the proportion
of missing values must be \strong{strictly} less than \code{prop}
(\code{strict = TRUE}) or only less than \code{prop} (\code{strict =
FALSE}).}

\item{n}{The maximum number of missing values allowed.}

\item{consec}{The maximum number of consecutive missing values allowed.}

\item{n_non}{The minimum number of \strong{non-missing} values required.}
}
\value{
A vector of the same type as \code{x}. Either \code{x} with missing
  values removed if all checks pass, or \code{x} unmodified if any checks
  fail.

  For consistency with \code{\link[stats]{na.omit}}, if missing
  values are removed, the indices of the removed values form an
  \code{na.action} attribute of class \code{omit} in the result.

  If missing values are not removed (because the checks failed or there were
  no missing values in \code{x}) then no \code{na.action} attribute is added.
}
\description{
These set of functions remove missing values from \code{x} if the single,
specified check is satisfied, and returns \code{x} unmodified otherwise. They
are special cases of \code{\link{na_omit_if}}, which is the general case for
specifying multiple checks.
}
\details{
These functions replicate the functionality of
\code{\link{na_omit_if}} as individual functions for single checks.

For example, \code{na_omit_if_consec(x, 4)} is equivalent to
\code{na_omit_if(x, consec = 4)}.

This more restricted form may be desirable when only a single check is
required.
}
