#'
#' @describeIn setup_BioLockR set the BioLockJ projects directory path
#'
#' @return set_BLJ_PROJ: boolean; TRUE if path is set for current session
#'
#' @export
#'
#' @examples
#' set_BLJ_PROJ( "path/to/projects/dir" )
#'
set_BLJ_PROJ <- function( path, remember=TRUE, doublecheck=TRUE ){
    if (! file.exists(path)){
        warning("path must be a valid file path.  There is not directory at location: ", path)
        return(FALSE)
    }else{
        options(BLJ_PROJ=path)
        if (remember){
            confirmed = ! doublecheck
            if (doublecheck){
                prompt = paste0("Path [", path, "] exists. \n Use this path for BioLockJ pipelines dir in future R sessions ? y / n \n")
                response = readline(prompt)
                confirmed = trimws( tolower(response) ) == "y"
            }
            if (confirmed){
                config = get_config_file_path()
                props = read_props_file(config)
                props[["BLJ_PROJ"]] = path
                write_properties(config, props)
            }
        }
    }
    return(TRUE)
}
