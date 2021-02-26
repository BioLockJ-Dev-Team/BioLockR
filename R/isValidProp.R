#' Is this property value valid ?
#'
#' Check individual BioLockJ property-value key pair for correct format.
#'
#' @inheritParams propInfo
#' @param value the value for property
#'
#' @return boolean
#' T/F/NA. Returns true if the value for the property is valid;
#' false if property is a known property but value is not a valid value for it,
#' and NA if property is not a recognized property.
#'
#' @details
#' IF a module is supplied, then additionally call the validateProp(key, value)
#' for that module, or for EACH module if a comma-separated list is given.
#'
#' @export
#'
#' @examples
#' isValidProp("script.numThreads", 8)
#' #> TRUE
#' isValidProp("script.numThreads", "apple")
#' #> FALSE
#' isValidProp("hardy", "har")
#' #> NA
#'
isValidProp <- function(property, value, module=NULL, externalModules=NULL ){
    args = c("isValidProp", "--property", property, "--value", paste0("\"", value, "\""))
    if ( !is.null(module) ){
        args = c(args, "--module", module)
    }
    val = callBioLockJApi(args, externalModules=externalModules)
    returnVal = NA
    if ( isReadableValue(val) ){
        if (val=="true") returnVal = TRUE
        if (val=="false") returnVal = FALSE
    }
    return(returnVal)
}
