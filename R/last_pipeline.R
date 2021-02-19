#' Get most recent pipeline
#'
#' @return top level file path of the most recently modified pipeline
#' @export
#'
#'
last_pipeline <-function(){
    args = "last-pipeline"
    if ( !file.exists( getBljProj() ) ){
        message("This method depends on the BLJ_PROJ variable.")
    }
    callBioLockJApi(args, useProj=TRUE)
}
