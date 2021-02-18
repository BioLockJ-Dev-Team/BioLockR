#' Separate elements of a BioLockJ list property
#'
#' @param value the single-string value a property
#'
#' @return a character vector of the separated elements of the list
#' @export
#'
#' @seealso printListProp
#'
#' @examples
#' parseListProp("one, two, three")
#' #>[1] "one"   "two"   "three"
#'
parseListProp <- function(value){
    if (isReadableValue(value)){
        return( trimws( unlist( strsplit( value, ",", fixed=TRUE) ) ) )
    }else{
        return(c())
    }
}
