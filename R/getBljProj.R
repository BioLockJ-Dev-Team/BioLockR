#' Get BioLockJ essential file paths
#'
#' @describeIn getBljJar
#'
#' @return the path to the BioLockJ project directory
#' @export
#'
#' @examples
#' getBljProj()
#'
getBljProj <- function(){
    path = Sys.getenv("BLJ_PROJ")
    if (path==""){
        path = readline("Please provide a directory where new pipeline instances can be created.\n")
        if(file.exists(path)){
            setBljProj(path)
        }
    }
    if (! file.exists(path)){
        warning("BLJ_PROJ path must exist! See ?setBljProj")
    }
    return(path)
}
