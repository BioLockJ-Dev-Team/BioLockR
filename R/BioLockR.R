#' BioLockR: A package accesssing the BioLockJ java program from R
#'
#' The primary motivation for this package is to facilitate an R shiny application,
#' which serves as a GUI for BioLockJ.
#' This package offeres an interface for interacting with the BioLockJ java program,
#' it does NOT include the BioLockJ java program.
#'
#'
#' @section biolockj-api querry analogues:
#'
#' Many functions are direct analogues to querries described in `biolockj-api help`,
#' these are usually camelCase to match the querry name, and they take the same options/arguments.
#'
#' last-pipeline (this is the only api method which requires BLJ_PROJ)
#' listModules
#' listApiModules
#' listProps
#' listAllProps
#' propType
#' describeProp
#' propValue
#' isValidProp
#' propInfo
#' moduleInfo
#' listMounts
#' listUploads
#' @seealso listUploads
#'
#' @section working with BioLockJ properties files:
#'
#' Other functions are useful for reading/writting BioLockJ properties files,
#' these are generall snake-case.
#'
#' read_properties
#' read_props_file
#' write_properties
#' extract_defautlProps
#' @seealso read_properties
#'
#' @seealso coinfg_BioLockR
#'
#' @docType package
#' @name BioLockR
NULL
#> NULL
