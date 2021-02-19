#'
#' @describeIn propInfo
#'
#' @return describeProp: the description of the property as a character string
#' @export
#'
#' @examples
#' describeProp("script.numThreads")
#' #> "Used to reserve cluster resources and passed to any external application call that accepts a numThreads parameter."
#'
describeProp <- function(property, module=NULL, externalModules=NULL ){
    # Returns a description of the property.
    # If a module is supplied, then the modules getDescription method is used.
    args = c("describeProp", "--property", property)
    if ( !is.null(module) ){
        args = c(args, "--module", module)
    }
    callBioLockJApi(args, externalModules=externalModules)
}
