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
#' The same setup can be done prgrammatically by using setBljJar() and setBljProj() with doublecheck=FALSE.
#'
#' setBljJar() and setBljProj() will prompt about using the settings for
#' future sessions (unless doublecheck=FALSE).  This interactive session is designed for an initial setup,
#' and automatically uses remember=TRUE and doublecheck=FALSE when seting BLJ_JAR and BLJ_PROJ.
#'
#' @seealso setBljJar
#' @seealso setBljProj
#'
#' @return
#' @export
#'
setup_BioLockR <- function(){
    config = get_config_file_path()
    vals = read_props_file( config )
    jar = tryCatch(getBljJar(), error=function(...){""})
    vals["BLJ_JAR"] = jar
    proj = tryCatch(getBljProj(), error=function(...){""})
    vals["BLJ_PROJ"] = proj

    cat(c("The BioLockR package is way to interact with the BioLockJ java program.",
          "At a minimim, it requires java and the path to the jar file in the BioLockJ folder:",
          ".../BioLockJ/dist/BioLockJ.jar",
          " ",
          "Checking for java..."), sep="\n")
    Sys.sleep(.5)

    javaVersion = tryCatch({
        system2("java",  "-version", stdout = TRUE, stderr = TRUE)
    }, error=function(...){""})
    if ( !any(javaVersion != "")){ #ie, if( javaVersion == "" )
        cat("There was problem accessing java. Do you want to continue with settup anyway?", sep="\n")
        res = readline("[ y / n ]")
        if (tolower(res) != "y") {
            #TODO: Add something about where to find help with this.
            cat("Goodbye.")
            return()
        }
    }else{
        cat(c("Found java...", javaVersion), sep="\n")
    }
    Sys.sleep(1)

    cat(c(" ",
    "BLJ_JAR",
    "If you have installed BioLockJ, you can get the path to it by typing",
    "\"echo $BLJ\" in a terminal window; R sessions may not detect this variable.",
    " ",
    "Please enter the path to update the BioLockJ jar file, BLJ_JAR:",
    "(leave blank to keep current value)",
    paste("[", jar, "]") ), sep="\n")
    response = readline("")

    if (trimws(response) != ""){
        # TODO: verify that this is a jar file, maybe call it and get the version.
        vals["BLJ_JAR"] = response
        # being in setup implies that it should be remembered
        setBljJar(response, remember = TRUE, doublecheck = FALSE)
        message("Got it!")
    }else{
        message("Keeping the existing value.")
    }
    cat("You can update this path at any time, see ?setBljJar ")
    Sys.sleep(2)

    cat(c(" "," ",
    "BLJ_PROJ",
    "If you have installed BioLockJ, you can get the path to it by typing",
    "\"echo $BLJ_PROJ\" in a terminal window; R sessions may not detect this variable.",
    "Your BLJ_PROJ folder is where new pipeline instances are created.",
    "It can be set to any writable directory on your machine; and should be somewhere you can access easily.",
    " ",
    "Please enter the path to update the BLJ_PROJ directory:",
    "(leave blank to keep current value)",
    paste("[", proj, "]")), sep="\n")
    responseP = readline("")

    if (trimws(responseP) != ""){
        if ( dir.exists(responseP) ){
            vals["BLJ_PROJ"] = responseP
            setBljProj(responseP, remember = TRUE, doublecheck = FALSE)
        }else{
            message("hmm... that's no good.  This value needs to be a directory that exists.")
            cat(c("Please enter the path to update the BLJ_PROJ directory:",
            "(leave blank to keep current value)",
            paste("[", proj, "]")), sep="\n")
            responseP2 = readline("")
            if (trimws(responseP2) != ""){
                if ( dir.exists(responseP2) ){
                    vals["BLJ_PROJ"] = responseP2
                    setBljProj(responseP2, remember = TRUE, doublecheck = FALSE)
                    cat("Got it!")
                }else{
                    message("Maybe try again later.  Most functions in BioLockR do not require BLJ_PROJ.")
                }
            }
        }
    }else{
        message("Keeping the existing value.")
    }
    cat("You can update this path at any time, see ?setBljProj ")
    Sys.sleep(1)


    # # TODO: review any other configurations that have been included.
    # others = setdiff(names(vals), c("BLJ_JAR", "BLJ_PROJ"))
    # if (length(others) > 0 ){
    #     cat("Review other paths configured for the BioLockR package:")
    #     for (name in others){
    #
    #     }
    # }
    #
    # # if there are other properties, then write them.
    # # with no other props, this currently redundant with saving via setBlj* functions
    write_properties(config, vals)

    cat(c(" "," ","Done with setup."), sep="\n")
}


