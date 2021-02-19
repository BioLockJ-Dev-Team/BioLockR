#' Property objects are named
#'
#' @param propList a list of property objects
#'
#' @return the propList, as a named list
#'
nameProperties <- function(propList){
    names = sapply(propList, function(prop){prop$property})
    names(propList) <- names
    return(propList)
}
