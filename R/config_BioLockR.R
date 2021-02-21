#' Configure BioLockR
#'
#' @description
#' Set BioLockJ Essential File Paths
#'
#' @param path
#' a file path to the BioLockJ jar file (set_BLJ_JAR()) to the BioLockJ project directory (setBljProj).
#' @param remember
#' TRUE/FALSE: Should this value be remembered for future sessions.
#' If true, the value is appended to the $HOME/.Renviron file, which can be edited
#' using: usethis::edit_r_environ()
#' @param doublecheck
#' (only used if remember==TRUE) should an interactive response be required before saving value to a file.
#'
#' @details
#'
#' The BioLockR package is way to interact with the BioLockJ java program.
#' At a minimim, it requires java and the path to the jar file in the BioLockJ folder:
#' .../BioLockJ/dist/BioLockJ.jar
#'
#' set_BLJ_JAR and setBljProj set variables BLJ_JAR and BLJ_PROJ respectively.
#'
#' setup_BioLockR
#' setup_BioLockR() launches an interactive mode that promps the user for the required settings.
#' The same setup can be done prgrammatically by using set_BLJ_JAR() and setBljProj() with doublecheck=FALSE.
#'
#' set_BLJ_JAR() and setBljProj() will prompt about using the settings for
#' future sessions (unless doublecheck=FALSE).  This interactive session is designed for an initial setup,
#' and automatically uses remember=TRUE and doublecheck=FALSE when seting BLJ_JAR and BLJ_PROJ.
#'
#' Unlike set_BLJ_JAR(), this method checks for java and also tests the jar file by attempting to get the BioLockJ version from it.
#' This check is skipped if java is not accessible.
#'
#' If you have BioLockJ installed, you have a variable $BLJ, and likley $BLJ_RPOJ.
#' These may not be detected in an R session, or an Rstudio R session.
#' If these are detected, they are used; otherwise they must be set manually.
#'
#' In some cases, an R session launched from the terminal may have access to the
#' variables, while a session launched in Rstudio does not. In this case,
#' run setup_BioLockR() from the terminal R session, and subsequent sessions in Rstudio will have the paths.
#'
#'
#' @return
#' "get" methods return a file path.
#' "set" methods, return boolean; TRUE if the value is set for that property
#'
#' @docType package
#' @name config_BioLockR
#'
NULL
#> NULL
