#' BioLockJ Version
#'
#' Get the version of BioLockJ. Optionally include the build string.
#'
#' @param showBuild TRUE/FALSE. If TRUE, the version string will include the build hash string.
#'
#' @return String giving the current BioLockJ version
#' @export
#'
#' @examples
#' biolockjVersion()
#' biolockjVersion(TRUE)
#'
biolockjVersion <- function(showBuild=FALSE){
    ver = tryCatch({
        callBioLockJ("--version")
    }, error = function(...){""})
    if ( is.null(ver) || is.na(ver) || length(ver) == 0 || ver=="") return("")
    if ( !showBuild ){
        ver = strsplit(ver, split="Build", fixed=TRUE)[[1]][1]
    }
    return(trimws(ver))
}
