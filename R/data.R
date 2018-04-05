#' Mouse Kinases and Corresponding Human Orthologs
#'
#' A dataset containing a list of mouse kinases and human orthologs, if present.
#' This list is directly from the kinase.com website with the pseudogenes remove
#' and most of the columns.
#'
#' @format A data frame with 555 rows and 2 columns
#' \describe{
#'   \item{Mouse_gene_name}{The mouse kinase name}
#'   \item{Human_ortholog}{The corresponding human ortholog gene name, if identified}
#' }
#' @source \url{http://kinase.com/mouse/}
"mouse_human_gene_names"

#' Human Dark Kinases
#'
#' A dataset containing a list of dark kinases
#'
#' @format A data frame with 162 rows and 1 column
#' \describe{
#'   \item{hgnc_id}{The human dark kinase name}
#' }
#' @source NIH and the Dark Kinase DRGC
"dark_kinase_list"
