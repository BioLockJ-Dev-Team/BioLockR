#' Get Class Path for BioLockJ call
#'
#' @param externalModules optional path to directory containing jar files for additional modules
#'
#' @return the class path string to use when calling BioLockJ
#'
getClassPath <- function(externalModules=NULL){
    cp = getBljJar()

    # Add JAR file to class path
    if ( !is.null(externalModules)){
        extras = list.files(path = externalModules, pattern=".jar")
        for (jar in extras ){
            cp = paste0(cp, ":", "")
        }
    }

    return(cp)
}
