% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zenodo_url.R
\name{zenodo_url}
\alias{zenodo_url}
\alias{zenodo_versions}
\title{Obtain the URL for a Zenodo record to be downloaded}
\usage{
zenodo_url(concept_rec_id = 3723356, rec_version = "latest",
  rec_id = NULL)

zenodo_versions(concept_rec_id, arg_checks = TRUE)
}
\arguments{
\item{concept_rec_id}{Concept record identifier, a \code{character} value
corresponding to the Zenodo concept.}

\item{rec_version}{\code{character} value of the version number or
\code{"latest"} (default) for the data to be download.}

\item{rec_id}{Optional input record identifier, a \code{character} value
corresponding to the Zenodo record.}
}
\value{
\code{zenodo_url}: \code{character} value of the URL for the zip
 to be downloaded. \cr \cr
 \code{zenodo_versions}: a \code{data.frame} of version number and record
 identifier for each version available.
}
\description{
\code{zenodo_url} obtains the URL for a given Zenodo record,
 identified either by the concept record identifier (\code{concept_rec_id})
 and version (\code{rec_version}) or record identifier (\code{rec_id}).
 (\strong{Note}: if \code{rec_id} is used, it overrides
 \code{concept_rec_id}). \cr \cr
 \code{zenodo_versions}: determines the available version numbers and the
 corresponding record identifier for each version available for a given
 Zenodo concept (group of records).
}
\examples{
 \donttest{
   zenodo_versions("3723356")
   zenodo_url("3723356", "latest")
   zenodo_url("3723356", "1.1.0")
 }

}
