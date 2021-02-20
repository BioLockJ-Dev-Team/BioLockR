#'
#' @describeIn config_BioLockR get the BioLockJ.jar file path
#'
#' @return get_BLJ_JAR: The path to the BioLockJ jar file
#'
#' @export
#'
#' @examples
#' # set_BLJ_JAR("/path/to/BioLockJ/dist/BioLockJ.jar")
#' # get_BLJ_JAR()
#'
get_BLJ_JAR <- function(){
    # have I already figured this out this session?
    BLJ_JAR=getOption("BLJ_JAR")
    if ( !isReadableValue(BLJ_JAR) ){
        # is it given in my config file ? if yes, use that!
        config = get_config_file_path()
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
        message("Please use set_BLJ_JAR() to set a valid location.")
        stop("Invalid location for BioLockJ jar file:\n  ", BLJ_JAR)
    }else{
        options(BLJ_JAR=BLJ_JAR) # remember for this sessions
        return(BLJ_JAR)
    }
}
