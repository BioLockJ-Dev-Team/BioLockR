#'
#'
#' @describeIn read_properties
#'
#' @return read_props_file(): is a wrapper for read_properties() that takes a file; returns result of read_properties().
#' @export
#'
#'
read_props_file <- function( filepath ){
    return( read_properties( readLines(filepath) ) )
}
