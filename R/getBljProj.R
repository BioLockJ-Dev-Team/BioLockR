#'
#' @describeIn setup_BioLockR get the BioLockJ projects directory path
#'
#' @return getBljProj: the path to the BioLockJ project directory
#'
#' @export
#'
#' @examples
#' # setBljProj("~/Documents/BioLockJ/pipelines")
#' # getBljProj()
#' # >[1] "~/Documents/BioLockJ/pipelines"
#'
getBljProj <- function(){
    # have I already figured this out this session?
    BLJ_PROJ=getOption("BLJ_PROJ")
    if ( !isReadableValue(BLJ_PROJ) ){
        # is it given in my config file ? if yes, use that!
        config = get_config_file_path()
        vals = read_props_file( config )
        BLJ_PROJ = vals[["BLJ_PROJ"]]
    }
    if ( !isReadableValue(BLJ_PROJ) ){
        # if its not there... is it in env ?
        BLJ_PROJ = Sys.getenv("BLJ_PROJ")
    }
    if ( !isReadableValue(BLJ_PROJ) || !file.exists(BLJ_PROJ) ) {
        message("Please use setBljProj() to set a valid location.")
        stop("Invalid location for BioLockJ project directory:\n  ", BLJ_PROJ)
    }else{
        options(BLJ_PROJ=BLJ_PROJ) # remember for this sessions
        return(BLJ_PROJ)
    }
}
