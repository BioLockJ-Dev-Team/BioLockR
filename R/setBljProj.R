#' Set BioLockJ Essential File Paths
#'
#' @describeIn setBljJar
#'
#' @return
#' @export
#'
#' @examples
#' setBljProj( "path/to/projects/dir" )
#'
setBljProj <- function( path, remember=TRUE, doublecheck=TRUE ){
    if (! file.exists(path)){
        warning("path must be a valid file path.  There is not directory at location: ", path)
        return(FALSE)
    }else{
        Sys.setenv(BLJ_PROJ=path)
        if (remember){
            home = Sys.getenv("HOME")
            if (home == "") home = Sys.getenv("R_USER")
            envFile = file.path(home, ".Renviron")
            #
            confirmed = ! doublecheck
            if (doublecheck){
                prompt = paste0("Path [", path, "] exists. \n Use this path for BLJ_PROJ in future R sessions ? y / n")
                response = readline(prompt)
                confirmed = trimws( tolower(response) ) == "y"
            }
            if (confirmed){
                line = paste0("BLJ_PROJ=", path)
                write(line, file=envFile, append=TRUE)
            }
        }
    }
    return(TRUE)
}
