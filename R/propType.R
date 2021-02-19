#'
#' @describeIn propInfo
#'
#' @return propType: the type of the property as a character string
#' @export
#'
#' @examples
#' propType("script.numThreads")
#' #> [1] "integer"
#'
propType <- function(property, module=NULL, externalModules=NULL ){
    # Returns the type expected for the property: String, list, integer, positive number, etc.
    # If a module is supplied, then the modules propType method is used.
    args = c("propType", "--property", property)
    if ( !is.null(module) ){
        args = c(args, "--module", module)
    }
    callBioLockJApi(args, externalModules=externalModules)
}
