#' Title
#'
#' @param value
#'
#' @return
#' @export
#'
#' @examples
#' isReadableValue(NA)
#' #> FALSE
#' isReadableValue(c())
#' #> FALSE
#' isReadableValue("")
#' #> FALSE
#' isReadableValue("text")
#' #> TRUE
#'
isReadableValue <- function( value ){
    return( !is.null(value) && !is.na(value) && length(value) > 0 && nchar(value) > 0 )
}
