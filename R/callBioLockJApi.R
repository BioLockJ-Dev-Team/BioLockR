#' Call the helper API of BioLockJ java program
#'
#' @inheritParams callBioLockJ
#' @param useProj boolean, should the vaue of get_BLJ_PROJ() be passed to the system call as an environment variable.
#' Unlike the main BioLockJ command, most of the API commands do not use BLJ_PROJ, and can run before that value is set.
#'
#' @return Any and all results that the BioLockJ java program prints to standard out
#'
callBioLockJApi <- function(args, externalModules=NULL, useProj=FALSE){
    CLASS = "biolockj/api/BioLockJ_API"
    cp = getClassPath( externalModules )
    CMD = utils::capture.output( cat("java -cp", cp, CLASS, args) )
    message(CMD)
    # return(system(CMD, intern = TRUE))
    args = strsplit(substring(CMD, 6), split=" ", fixed=TRUE)[[1]]
    if (useProj){
        return( system2("java", args = args, stdout=TRUE,
                        env = paste0( "BLJ_PROJ=", get_BLJ_PROJ() )) )
    }else{
        return( system2("java", args = args, stdout=TRUE) )
    }

}
