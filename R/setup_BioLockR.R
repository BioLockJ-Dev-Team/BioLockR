#' Setup required file paths
#'
#' This command launches an interactive mode that promps the user for the required settings.
#'
#' @details
#' The BioLockR package is way to interact with the BioLockJ java program.
#' At a minimim, it requires java and the path to the jar file in the BioLockJ folder:
#' .../BioLockJ/dist/BioLockJ.jar
#'
#' This command launches an interactive mode that promps the user for the required settings.
#' The same setup can be done prgrammatically by using set_BLJ_JAR() and setBljProj() with doublecheck=FALSE.
#'
#' set_BLJ_JAR() and setBljProj() will prompt about using the settings for
#' future sessions (unless doublecheck=FALSE).  This interactive session is designed for an initial setup,
#' and automatically uses remember=TRUE and doublecheck=FALSE when seting BLJ_JAR and BLJ_PROJ.
#'
#' Unlike set_BLJ_JAR(), this method checks for java and also tests the jar file by attempting to get the BioLockJ version from it.
#' This check is skipped if java is not accessible.
#'
#' @seealso set_BLJ_JAR
#' @seealso setBljProj
#'
#' @return no returned value
#' @export
#'
setup_BioLockR <- function(){
    jar = tryCatch(get_BLJ_JAR(), error=function(...){""})
    proj = tryCatch(getBljProj(), error=function(...){""})

    cat(c("The BioLockR package is way to interact with the BioLockJ java program.",
          "At a minimim, it requires java and the path to the jar file in the BioLockJ folder:",
          ".../BioLockJ/dist/BioLockJ.jar",
          " ",
          "Checking for java..."), sep="\n")
    Sys.sleep(.5)

    testWithJava = checkJava()

    Sys.sleep(1)

    response = promptForJar(jar)

    if (response == ""){
        ignoreValue()
    }else{
        newJar = response
        newJar = BLJisOK(newJar)
        passing = file.exists(newJar)
        if (!passing) ignoreValue("hmm... That does not look like a real file.")
        if ( passing && testWithJava ) passing = testJar(newJar=newJar, oldJar=jar)
        # set the jar file
        if (passing){
            didIt = set_BLJ_JAR(newJar, remember = TRUE, doublecheck = FALSE)
            if (didIt){
                if (!testWithJava) message("Got it! (set but not tested)")
            }else{
                ignoreValue("hmm... That's no good. See ?set_BLJ_JAR")
            }
        }
    }
    cat("You can update this path at any time, see ?set_BLJ_JAR ")
    Sys.sleep(2)

    projInfo()
    responseP = promptForProj(proj)

    if (trimws(responseP) == ""){
        ignoreValue()
    }else{
        if ( dir.exists(responseP) ){
            setBljProj(responseP, remember = TRUE, doublecheck = FALSE)
        }else{
            message("hmm... that's no good.  This value needs to be a directory that exists.")
            responseP2 = promptForProj(proj)
            if (trimws(responseP2) != ""){
                if ( dir.exists(responseP2) ){
                    setBljProj(responseP2, remember = TRUE, doublecheck = FALSE)
                    cat("Got it!")
                }else{
                    ignoreValue("Maybe try again later.  Most functions in BioLockR do not require BLJ_PROJ.")
                }
            }else{
                ignoreValue()
            }
        }
    }
    cat("You can update this path at any time, see ?setBljProj ")
    Sys.sleep(1)

    cat(c(" "," ","Done with setup."), sep="\n")
}

checkJava <- function(){
    javaVersion = tryCatch({
        system2("java",  "-version", stdout = TRUE, stderr = TRUE)
    }, error=function(...){""})
    if ( !any(javaVersion != "")){ #ie, if( javaVersion == "" )
        testWithJava = FALSE
        message("There was problem accessing java. Do you want to continue with settup anyway?")
        res = readline("[ y / n ] ")
        if (tolower(res) != "y") {
            #TODO: Add something about where to find help with this.
            return(cat("Goodbye."))
        }else{
            message("Ok. We'll go ahead set up these paths now anyway.")
        }
    }else{
        testWithJava = TRUE
        cat(c("Found java...", javaVersion), sep="\n")
    }
    return(testWithJava)
}

promptForJar <- function(jar){
    cat(c(" ",
          "BLJ_JAR",
          "If you have installed BioLockJ, you can get the path to it by typing",
          "\"echo $BLJ\" in a terminal window; R sessions may not detect this variable.",
          " ",
          "Please enter the path to update the BioLockJ jar file, BLJ_JAR:",
          "(leave blank to keep current value)",
          paste("[", jar, "]") ), sep="\n")
    response = trimws(readline("BLJ_JAR: "))
    return(response)
}

projInfo <- function(){
    cat(c(" "," ",
          "BLJ_PROJ",
          "If you have installed BioLockJ, you can get the path to it by typing",
          "\"echo $BLJ_PROJ\" in a terminal window; R sessions may not detect this variable.",
          "Your BLJ_PROJ folder is where new pipeline instances are created.",
          "It can be set to any writable directory on your machine; and should be somewhere you can access easily."),
          sep="\n")
}
promptForProj <- function(proj){
    cat(c(" ",
          "Please enter the path to update the BLJ_PROJ directory:",
          "(leave blank to keep current value)",
          paste("[", proj, "]")), sep="\n")
    responseP = readline("BLJ_PROJ: ")
    return(responseP)
}

BLJisOK <- function(newJar){
    if (dir.exists(newJar) && file.exists(file.path(newJar, "dist", "BioLockJ.jar"))){
        # User just pasted $BLJ not $BLJ/dist/BioLockJ.jar... that's ok.
        newJar = file.path(newJar, "dist", "BioLockJ.jar")
        message(paste("That makes BLJ_JAR:", newJar))
    }
    return(newJar)
}

testJar <- function(newJar, oldJar){
    didSet = set_BLJ_JAR(newJar, remember = FALSE)
    if (didSet){
        newVersion = tryCatch({
            suppressMessages( biolockjVersion() )
        }, error=function(...){
            set_BLJ_JAR(oldJar, remember = FALSE) # restore
            return("")})
    }else{
        newVersion = ""
    }
    passing = startsWith(newVersion, "BioLockJ v")
    if (didSet && passing){
        message("Great! We're set up to use ", newVersion)
    }else{
        ignoreValue("hmm... That doesn't seem right.")
    }
    return(passing)
}

ignoreValue <- function(msg=NULL){
    if (!is.null(msg)) message(msg)
    message("Keeping the existing value.")
}
