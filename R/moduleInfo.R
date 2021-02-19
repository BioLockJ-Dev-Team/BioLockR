#' Get Module Info
#'
#' Get list of modules currently available to the BioLockJ java program.
#'
#' @inheritParams callBioLockJ
#'
#' @seealso listModules
#' @seealso listApiModules
#' @seealso propInfo
#'
#' @export
#'
#' @return a list of moduleInfo objects,
#' each has named values for module aspects include a named list of property objects
#' very similar to the output of propInfo().
#'
#' @examples
#' moduleInfo()
#'
moduleInfo <- function(externalModules=NULL){
    args=c("moduleInfo")
    json_lines = callBioLockJApi(args, externalModules=externalModules)
    json_str = paste(json_lines, collapse="")
    obj = rjson::fromJSON(json_str)
    names(obj) <- sapply(obj, function(mi){mi$title})
    moduleIn <- lapply(obj, function(mi){
        mi$properties = nameProperties(mi$properties)
        return(mi)
    })
    return(moduleIn[order(names(moduleIn))])
}
