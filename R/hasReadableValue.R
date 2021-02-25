#'
#' @describeIn isReadableValue return a single boolean, recommended for logic flow.
#'
#' Use this method to prevent failures from NULL, NA, or empty values.
#'
#' @param value usually the value of a property or a user response.
#'
#' @return a single boolean. Return FALSE if value is NULL, NA, empty vector/list or empty string; otherwise return TRUE.
#' @export
#'
#' @examples
#' hasReadableValue(NA)
#' #> FALSE
#' hasReadableValue(c())
#' #> FALSE
#' hasReadableValue("")
#' #> FALSE
#' hasReadableValue("text")
#' #> TRUE
#' # hasReadableValue(c(1,2,3,NA,4))
#' # #> TRUE
#' # hasReadableValue(list(a=c(1,2,NA), b=c("app"), c=NA, d=""))
#' # #> TRUE
#'
hasReadableValue <- function( value ){
    return( any( unlist( isReadableValue( value ) ) ) )
}
