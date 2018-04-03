# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

#' Get Kinase Lists
#'
#' @description
#' This function reads a CSV file with the list of dark kinases
#'
#' @return A data.frame with a list of the dark kinases
#' @export

get_dark_kinase_names <- function() {
  kinase_names = read.csv('data/Dark Kinase List.csv')
  return(kinase_names)
}
