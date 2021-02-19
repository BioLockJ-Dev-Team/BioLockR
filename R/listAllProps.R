#'
#' @describeIn listProps
#'
#' @inheritParams callBioLockJ
#'
#' @return character vector of property names
#' @export
#'
listAllProps <- function(externalModules=NULL){
    # Returns a list of all properties, include all backbone properties and all module properties.
    # Optionally supply the path to a directory containing additional modules to include their properties.
    args = c("listAllProps")
    callBioLockJApi(args, externalModules=externalModules)
}
