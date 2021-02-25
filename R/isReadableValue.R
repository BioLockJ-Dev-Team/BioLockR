#' Is Readable Value
#'
#' Use this method to prevent failures from NULL, NA, or empty values.
#'
#' @describeIn isReadableValue result may be a vector or matrix reflecting the structure of _value_; recommended for subsetting.
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
#' # isReadableValue(c(1,2,3,NA,4))
#' # #> TRUE  TRUE  TRUE FALSE  TRUE
#' # isReadableValue(list(a=c(1,2,NA), b=c("app"), c=NA, d=""))
#' # #> $a
#' # #> [1]  TRUE  TRUE FALSE
#' # #> $b
#' # #> [1] TRUE
#' # #> $c
#' # #> [1] FALSE
#' # #> $d
#' # #> [1] FALSE
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
