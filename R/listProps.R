#' List BioLockJ Properties
#'
#' Display the properties currently used by the BioLockJ java program. Optionally specify a module.
#'
#' @param module If specified, the property list returned will be the properties used by this module.
#'
#' @details
#' If no module is specified, the properties returned are the general properties.
#' If a module is specified, then only the properties used by that module are returned,
#' which usually has some overlap with the general peroperties.
#'
#' listAllProps() is equivalent to the combined set of listProps() with no args and
#' listProps(module) for all available modules.
#'
#' @describeIn listProps
#'
#' @return character vector of property names
#' @export
#'
#' @examples
#' listProps()
#'
listProps <- function(module=NULL){
    args = c("listProps")
    if ( !is.null(module) ){
        args = c(args, "--module", module)
    }
    callBioLockJApi(args)
}
