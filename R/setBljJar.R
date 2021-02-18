#' Set BioLockJ Essential File Paths
#'
#' setBljJar and setBljProj set variables BLJ_JAR and BLJ_PROJ respectively.
#' These variables can also be set by adding them to your .Renviron file, which
#' can be edited using: \code{usethis::edit_r_environ()} .
#'
#' @seealso getBljJar, getBljProj
#'
#' @param path a file path to the BioLockJ jar file (setBljJar()) to the BioLockJ project directory (setBljProj).
#' @param remember TRUE/FALSE: Should this value be remembered for future sessions.
#' If true, the value is appended to the $HOME/.Renviron file, which can be edited
#' using: usethis::edit_r_environ()
#' @param doublecheck (only used if remember==TRUE) should an interactive response be required before saving value to a file.
#'
#' @describeIn setBljJar
#'
#' @return TRUE if path is set for current session
#' @export
#'
#' @examples
#' setBljJar("path/to/BioLockJ/dist/BioLockJ.jar")
#'
setBljJar <- function( path, remember=TRUE, doublecheck=TRUE ){
    if (! file.exists(path)){
        warning("path must be a valid file path.  File does not exist: ", path)
        return(FALSE)
    }else{
        Sys.setenv(BLJ_JAR=path)
        if (remember){
            home = Sys.getenv("HOME")
            if (home == "") home = Sys.getenv("R_USER")
            envFile = file.path(home, ".Renviron")
            #
            confirmed = ! doublecheck
            if (doublecheck){
                prompt = paste0("Path [", path, "] exists. \n Use this path for BioLockJ jar file in future R sessions ? y / n \n")
                response = readline(prompt)
                confirmed = trimws( tolower(response) ) == "y"
            }
            if (confirmed){
                line = paste0("BLJ_JAR=", path)
                write(line, file=envFile, append=TRUE)
            }
        }
    }
    return(TRUE)
}
