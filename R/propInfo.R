#' Get Information about BioLockJ Properties
#'
#'
#' @describeIn propInfo
#'
#' @inheritParams callBioLockJ
#' @param property the name of a property
#' @param config a BioLockJ config file (or properties file) to reference
#' @param module a BioLockJ module
#'
#' @return propInfo: a list of property objects, where each element has named values for "property" (ie name), "type", and "description" and (when applicable) "default".
#' @export
#'
#' @examples
propInfo <- function(){
    args=c("propInfo")
    json_lines = callBioLockJApi(args)
    json_str = paste(json_lines, collapse="")
    obj = rjson::fromJSON(json_str)
    return(nameProperties(obj))
}
