#' Call the BioLockJ java program
#'
#' @param args args to pass to BioLockJ java program
#' @param externalModules file path to directory with external modules
#'
#' @return Any and all results that the BioLockJ java program prints to standard out
#'
callBioLockJ <- function(args, externalModules=NULL){
    CLASS = "biolockj/BioLockJ"
    cp = getClassPath( externalModules ) # calls getBljJar()
    CMD = utils::capture.output( cat("java -cp", cp, CLASS, args) )
    message(CMD)
    # return(system(CMD, intern = TRUE))
    return( system2("java",
                    args = strsplit(substring(CMD, 6), split=" ", fixed=TRUE)[[1]],
                    stdout=TRUE,
                    env = paste0( "BLJ_PROJ=", getBljProj() )) )
}
