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
#' # setBljJar("/path/to/BioLockJ/dist/BioLockJ.jar")
#' # getBljJar()
#'
getBljJar <- function(){
    # have I already figured this out this session?
    BLJ_JAR=getOption("BLJ_JAR")
    if ( !isReadableValue(BLJ_JAR) ){
        # is it given in my config file ? if yes, use that!
        config = system.file("config", "paths.properties", package = "BioLockR")
        vals = read_props_file( config )
        BLJ_JAR = vals[["BLJ_JAR"]]
    }
    if ( !isReadableValue(BLJ_JAR) ){
        # if its not there... is BLJ in env ?
        BLJ_DIR = Sys.getenv("BLJ")
        if ( isReadableValue(BLJ_DIR) && file.exists(BLJ_DIR)){
            BLJ_JAR = file.path(BLJ_DIR, "dist", "BioLockJ.jar")
        }
    }
    if ( !isReadableValue(BLJ_JAR) || !file.exists(BLJ_JAR) ) {
        message("Please use setBljJar() to set a valid location.")
        stop("Invalid location for BioLockJ jar file:\n  ", BLJ_JAR)
    }else{
        options(BLJ_JAR=BLJ_JAR) # remember for this session
        return(BLJ_JAR)
    }
}
