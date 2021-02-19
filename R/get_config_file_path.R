#' Get BioLockR settings file
#'
#' Get the path to the file where the BioLockR package saves user preferences,
#' namely the path to BLJ_JAR and BLJ_PROJ.
#'
#' @return
#'
get_config_file_path <- function(){
    dirName = "config"
    fileName = "paths.properties"
    config = system.file(dirName, fileName, package = "BioLockR")[1]
    if ( config == "" ){
        # there was no file matching the parameters; create it.
        dir = file.path(system.file(package = "BioLockR"), dirName)
        if ( ! dir.exists(dir) ) dir.create( dir )
        file.create(file.path(dir, fileName))
        config = system.file(dirName, fileName, package = "BioLockR")
    }
    return( config )
}
