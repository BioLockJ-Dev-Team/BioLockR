#'
#' @describeIn setup_BioLockR set the BioLockJ.jar file path
#'
#' @return set_BLJ_JAR: boolean; TRUE if path is set for current session
#'
#' @export
#'
#' @examples
#' set_BLJ_JAR("path/to/BioLockJ/dist/BioLockJ.jar")
#'
set_BLJ_JAR <- function( path, remember=TRUE, doublecheck=TRUE ){
    if (! file.exists(path)){
        warning("`path` must be a valid file path.  File does not exist: ", path)
        return(FALSE)
    }else{
        options(BLJ_JAR=path)
        if (remember){
            confirmed = ! doublecheck
            if (doublecheck){
                prompt = paste0("Path [", path, "] exists. \n Use this path for BioLockJ jar file in future R sessions ? y / n \n")
                response = readline(prompt)
                confirmed = trimws( tolower(response) ) == "y"
            }
            if (confirmed){
                config = get_config_file_path()
                props = read_props_file(config)
                props[["BLJ_JAR"]] = path
                write_properties(config, props)
            }
        }
        return(TRUE)
    }
}
