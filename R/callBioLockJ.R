#' Call the BioLockJ java program
#'
#' @param args args to pass to BioLockJ java program
#' @param external.modules file path to directory with external modules
#'
#' @return Any and all results that the BioLockJ java program prints to standard out
#'
callBioLockJ <- function(args, external.modules=NULL){
    JAR = getBljJar()
    CLASS = "biolockj/BioLockJ"
    cp = getClassPath( external.modules )
    CMD = utils::capture.output( cat("java -cp", JAR, CLASS, args) )
    message(CMD)
    # return(system(CMD, intern = TRUE))
    return( system2("java",
                    args = strsplit(substring(CMD, 6), split=" ", fixed=TRUE)[[1]],
                    env = paste0( "BLJ_PROJ=", getBljProj() )) )
}
