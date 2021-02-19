#' List Modules
#'
#' Get a simple list of all BioModules available to BioLockJ that are also API modules.
#'
#' @inheritParams callBioLockJ
#'
#' @seealso listModules
#' @seealso moduleInfo
#'
#' @return vector of module classpaths
#' @export
#'
#' @examples
#' listApiModules()
#'
listApiModules <- function(externalModules=NULL){
    args = c("listApiModules")
    callBioLockJApi(args, externalModules=externalModules)
}
