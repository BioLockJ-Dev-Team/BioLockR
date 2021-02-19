#' List Required Files
#'
#' @return listUploads: a list of file and directories that would need to be uploaded in order for
#' the files listed in the config file to be available to a pipeline running in the cloud.
#'
#' @describeIn listMounts
#'
#' @export
#'
listUploads <- function(config){
    args=c("listUploads", "--config", config)
    callBioLockJApi(args)
}
