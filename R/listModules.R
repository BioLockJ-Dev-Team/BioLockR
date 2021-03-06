#' List Modules
#'
#' Get a simple list of all BioModules available to BioLockJ.
#'
#' @inheritParams callBioLockJ
#'
#' @return vector of module classpaths
#' @export
#'
#' @seealso listApiModules
#' @seealso moduleInfo
#'
#' @examples
#' listModules()
#'
listModules <- function(externalModules=NULL){
    args = c("listModules")
    callBioLockJApi(args, externalModules=externalModules)
}
