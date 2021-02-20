#' Get Class Path for BioLockJ call
#'
#' @param externalModules optional path to directory containing jar files for additional modules
#'
#' @return the class path string to use when calling BioLockJ
#'
getClassPath <- function(externalModules=NULL){
    cp = get_BLJ_JAR()

    # Add JAR file to class path
    if ( !is.null(externalModules)){
        extras = list.files(path = externalModules, pattern=".jar", full.names = TRUE)
        for (jar in extras ){
            cp = paste0(cp, ":", jar)
        }
    }

    return(cp)
}
