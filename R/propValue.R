#'
#' @describeIn propInfo
#'
#' @return propValue: the value of the property (iether the default or the value as specified in config)
#' @export
#'
#' @examples
propValue <- function(property, config=NULL, module=NULL, externalModules=NULL ){
    # Returns the value for that property given that config file (optional) or
    # no config file (ie the default value)
    args = c("propValue", "--property", property)
    if ( !is.null(config) ){
        args = c(args, "--config", config)
    }
    if ( !is.null(module) ){
        args = c(args, "--module", module)
    }
    returnVal = callBioLockJApi(args, externalModules=externalModules)
    if (returnVal=="null") returnVal = ""
    return(returnVal)
}
