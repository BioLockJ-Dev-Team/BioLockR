#' Write Properties
#'
#' Write properties in the format expected by BioLockJ. This does not incorporate any human-readable nicities.
#'
#' @param file file location to right properties to
#' @param properties named vector or named list of property values
#' @param moduleLines character vector representing a module run order for a BioLockJ configuration
#'
#' @return If file is NULL, returns a character vector of the lines that would make up the config file;
#' if file is given, the lines are written to the file and the function returns TRUE.
#'
#' @export
#'
#'
write_properties <- function(file=NULL, properties=NULL, moduleLines=NULL){
    lines=c()
    if (isReadableValue(moduleLines)){
        lines = c(lines, moduleLines)
    }
    if (isReadableValue(properties) && isReadableValue(names(properties))){
        for (name in names(properties)){
            line = paste0(name, "=", printListProp(properties[[name]]))
            lines = c(lines, line)
        }
    }
    if (!is.null(file)){
        writeLines(lines, file)
        return( TRUE )
    }else{
        return( lines )
    }
}
