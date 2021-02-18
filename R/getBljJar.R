#' Get BioLockJ essential file paths
#'
#' Get the essential file paths associated with the BioLockJ java program.
#'
#' @details
#' getBljJar returns the path to the jar file of the BioLockJ java program based on either BLJ_JAR (if set) or BLJ.
#'
#' bljProj returns the path to the BioLockJ project directory (where new pipeline instances are created) based on environemnt variable BLJ_PROJ.
#'
#' @seealso setBljJar, setBljProj
#'
#' @return The path to the BioLockJ jar file
#'
#' @export
#'
#' @examples
#' getBljJar()
#'
getBljJar <- function(){
    BLJ_JAR = Sys.getenv("BLJ_JAR")
    if (is.null(BLJ_JAR) || is.na(BLJ_JAR) || length(BLJ_JAR) < 1 || BLJ_JAR=="" ){
        BLJ_DIR = Sys.getenv("BLJ")
        if (is.null(BLJ_DIR) || is.na(BLJ_DIR) || length(BLJ_DIR) < 1 || BLJ_DIR=="" ){
            dir = system.file('BioLockJ',package = 'BioLockR')
            Sys.setenv(BLJ_DIR=dir)
        }
        BLJ_JAR = file.path(BLJ_DIR, "dist", "BioLockJ.jar")
    }
    if ( !file.exists(BLJ_JAR) ) stop("Invalid location for BioLockJ jar file:", BLJ_JAR)
    return(BLJ_JAR)
}
