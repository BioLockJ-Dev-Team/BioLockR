#' Assemble a BioLockJ list property
#'
#' @param values a vecotr of values to combine as one list property
#'
#' @return a single string representing the set of values as a comma-separated list
#' @export
#'
#' @seealso parseListProp
#'
#' @examples
#'
# printListProp(c("one", "two", "three"))
# #> [1] "one, two, three"
#
printListProp <- function( values ){
    vals = values[isReadableValue(values)]
    if (isReadableValue(vals)){
        return(paste(vals, collapse=", "))
    }else{
        return("")
    }
}
