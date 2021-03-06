% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/isValidProp.R
\name{isValidProp}
\alias{isValidProp}
\title{Is this property value valid ?}
\usage{
isValidProp(property, value, module = NULL, externalModules = NULL)
}
\arguments{
\item{property}{the name of a property}

\item{value}{the value for property}

\item{module}{a BioLockJ module}

\item{externalModules}{file path to directory with external modules}
}
\value{
boolean
T/F/NA. Returns true if the value for the property is valid;
false if property is a known property but value is not a valid value for it,
and NA if property is not a recognized property.
}
\description{
Check individual BioLockJ property-value key pair for correct format.
}
\details{
IF a module is supplied, then additionally call the validateProp(key, value)
for that module, or for EACH module if a comma-separated list is given.
}
\examples{
isValidProp("script.numThreads", 8)
#> TRUE
isValidProp("script.numThreads", "apple")
#> FALSE
isValidProp("hardy", "har")
#> NA

}
