% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spark_bars.R
\name{sparkbars}
\alias{sparkbars}
\title{Prints sparkbars from the data}
\usage{
sparkbars(x, midpoint = 0, colors = FALSE, range = TRUE)
}
\arguments{
\item{x}{a vector with the data to plot.}

\item{midpoint}{midpoint that marks the "zero" line.}

\item{colors}{whether to use colors or not.}

\item{range}{whether to print the range.}
}
\description{
Prints sparkbars from the data
}
\examples{
x <- rnorm(10)
sparkbars(x, colors = TRUE)
sparkbars(x, midpoint = 1, colors = TRUE)

# NAs are indicated.
x[c(3, 6)] <- NA
sparkbars(x)

}
