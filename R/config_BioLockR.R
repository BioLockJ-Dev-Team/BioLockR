#' Configure BioLockR
#'
#' Set BioLockJ Essential File Paths
#' <br>
#' setBljJar and setBljProj set variables BLJ_JAR and BLJ_PROJ respectively.
#' These variables can also be set by adding them to your .Renviron file, which
#' can be edited using: usethis::edit_r_environ() .
#'
#' @param path
#' a file path to the BioLockJ jar file (setBljJar()) to the BioLockJ project directory (setBljProj).
#' @param remember
#' TRUE/FALSE: Should this value be remembered for future sessions.
#' If true, the value is appended to the $HOME/.Renviron file, which can be edited
#' using: usethis::edit_r_environ()
#' @param doublecheck
#' (only used if remember==TRUE) should an interactive response be required before saving value to a file.
#'
#' @details
#' If you have BioLockJ installed, you have a variable $BLJ, and likley $BLJ_RPOJ.
#' These may not be detected in an R session, or an Rstudio R session.
#' If these are detected, they are used; otherwise they must be set manually.
#' In a terminal session try: echo $BLJ
#' Copy this path and use it with setBljJar().
#'
#' In some cases, an R session launched from the terminal may have access to the
#' variables, while a session launched in Rstudio does not. In this case, open R from a terminal
#' and run:
#' library(BioLockR)
#' setBljJar(getBljJar(), remember=TRUE)
#' Now subsequent sessions in Rstudio will have the jar path.
#'
#' If you update your BioLockJ location, use setbljJar("", remember=TRUE) and then repeat the above steps.
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
