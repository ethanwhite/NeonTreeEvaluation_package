% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/IoU.R
\name{IoU}
\alias{IoU}
\title{Intersection-over-union of two polygons}
\usage{
IoU(x, y)
}
\arguments{
\item{x}{A SpatialPolygonDataFrame of length 1}

\item{y}{A SpatialPolygonDataFrame of length 1}
}
\value{
a numeric value indiciating the jaccard overlap
}
\description{
\code{IoU} finds the jaccard statistic for two input polygons
}
