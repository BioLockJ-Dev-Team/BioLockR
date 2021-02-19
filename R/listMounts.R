#' List Required Files
#'
#' Create a list of files and/or dirs that a pipeline will need to have access to based on the config file.
#'
#' @param config The BioLockJ config file (or properties file) to scan for required files/dirs.
#'
#' @return listMounts: a list of directories that would need to be mounted in order for
#' the files listed in the config file to be available to a pipeline running in docker.
#'
#' @describeIn listMounts
#'
#' @export
#'
listMounts <- function(config){
    args=c("listUploads", "--config", config)
    callBioLockJApi(args)
}
