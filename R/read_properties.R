#' Read BioLockJ properties
#'
#' Read properties from a BioLockJ config file or properties file, or a vector of lines representing BioLockJ properties.
#'
#' @param existingLines a character vector, usually the result of readLines()
#' @param filepath character string, exactly one, giving the path to the file to read.
#'
#' @describeIn read_properties
#'
#' @return read_properties: returns a named character vector.  Names are property names (left of =), values are property values (right of =).
#'
#' @export
#'
#' @examples
#' ex1 = system.file("extdata", "example_with_defaults.properties", package = "BioLockR")
#' read_props_file(ex1)
#'
#' ex2 = system.file("extdata", "example_no_defaults.properties", package = "BioLockR")
#' read_properties( readLines(ex2) )
#' # identical to:
#' read_props_file(ex2)
#'
#' vals = c("name=value", "property.name=its value", "property.other=another value")
#' read_properties( vals )
#'
read_properties <- function(existingLines){
    propLines = existingLines[ grep("^#", existingLines, invert = TRUE) ]
    if ( any(grepl("=", propLines)) ){
        splits = strsplit(propLines, split="=", fixed=TRUE)
        splits = splits[which(sapply(splits, function(s){length(s) >= 2}))]
        vals = sapply(splits, function(pair){trimws(paste0(pair[2:length(pair)], collapse=""))})
        names(vals) = sapply(splits, function(pair){trimws(pair[1])})
        return(vals)
    }else{
        return(c())
    }
}
