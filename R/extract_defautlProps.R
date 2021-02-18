#' Separate the simple properties from chained properties files
#'
#' @inheritParams read_props_file
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
extract_defautlProps <- function( filepath ){
    vals = read_props_file( filepath )
    ret = list(defaultProps=c(), properties=c())
    if ( length(vals) > 0 ){
        ret$properties=vals[names(vals) != "pipeline.defaultProps"]
        chainsTo = vals["pipeline.defaultProps"]
        if ( isReadableValue(chainsTo)){
            ret$defaultProps = parseListProp(chainsTo)
        }
    }
    return(ret)
}
