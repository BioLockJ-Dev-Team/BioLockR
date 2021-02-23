#' Is Readable Value
#'
#' Use this method to prevent failures from NULL, NA, or empty values.
#'
#' @param value usually the value of a property or a user response.
#'
#' @return boolean. Return FALSE if value is NULL, NA, empty vector/list or empty string; otherwise return TRUE.
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
    readable = !is.null(value) && !is.na(value) && length(value) > 0
    if (readable){
        if (length(value) == 0) {
            readable = FALSE
        }else if(length(value) == 1){
            if (nchar(value) == 0) readable = FALSE
        }else if(length(value) > 1){
            readable = sapply(value, isReadableValue)
        }
    }
    return( readable )
}
