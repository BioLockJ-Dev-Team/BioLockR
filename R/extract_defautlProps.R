#' Separate the simple properties from chained properties files
#'
#' @param values named property values, often the result of read_properties or read_props_file
#'
#' @return returns a list of 2:
#' where the first element ("defaultProps") is a list of defaultProps files (NULL if there is no defaultProps property)
#' and the second ("properties") is all other properties as returned by read_properties.
#'
#' @export
#'
#' @examples
#' ex1 = system.file("extdata", "example_with_defaults.properties", package = "BioLockR")
#' extract_defautlProps(ex1)
#'
#' ex2 = system.file("extdata", "example_no_defaults.properties", package = "BioLockR")
#' extract_defautlProps(ex2)
#'
extract_defautlProps <- function( values ){
    ret = list(defaultProps=c(), properties=c())
    if ( length(values) > 0 ){
        ret$properties=values[names(values) != "pipeline.defaultProps"]
        chainsTo = values["pipeline.defaultProps"]
        if ( isReadableValue(chainsTo)){
            ret$defaultProps = parseListProp(chainsTo)
        }
    }
    return(ret)
}
