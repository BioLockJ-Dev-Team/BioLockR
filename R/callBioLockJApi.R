#' Call the helper API of BioLockJ java program
#'
#' @inheritParams callBioLockJ
#'
#' @return Any and all results that the BioLockJ java program prints to standard out
#'
callBioLockJApi <- function(args, external.modules=NULL){
    JAR = getBljJar()
    CLASS = "biolockj/api/BioLockJ_API"
    cp = getClassPath( external.modules )
    CMD = utils::capture.output( cat("java -cp", JAR, CLASS, args) )
    message(CMD)
    return(system(CMD, intern = TRUE))
}
