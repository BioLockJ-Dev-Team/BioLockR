#' Get Class Path for BioLockJ call
#'
#' @param external.modules optional path to directory containing jar files for additional modules
#'
#' @return the class path string to use when calling BioLockJ
#'
getClassPath <- function(external.modules=NULL){
    cp = getBljJar()

    # Add JAR file to class path
    if ( !is.null(external.modules)){
        extras = list.files(path = external.modules, pattern=".jar")
        for (jar in extras ){
            cp = paste0(cp, ":", "")
        }
    }

    return(cp)
}
