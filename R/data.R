#' Human Dark Kinases
#'
#' A dataset containing a list of dark kinases.
#'
#' @format A data frame with 162 rows and 2 columns
#' \describe{
#'   \item{hgnc_id}{The human dark kinase name}
#' }
#' @source NIH and the Dark Kinase DRGC
"dark_kinase_list"

#' All Human Kinases
#'
#' A dataset containing a list of human kinases. This list has several
#' pseudokinases, as they are included in the dark kinase list.
#'
#' @format A data frame with 524 rows and 5 columns
#' \describe{
#'   \item{hgnc_id}{The human dark kinase ID from HGNC}
#'   \item{symbol}{The human dark kinase symbol from HGNC}
#'   \item{ensembl_gene_id}{ID from ensembl}
#'   \item{class}{Either Dark or Light, depending on the understudied-ness}
#'   \item{kinase_com_name}{The name used on the kinase.com list, used for cross-referencing other lists from kinase.com}
#' }
#' @source NIH, the Dark Kinase DRGC, HGNC and kinase.com
"all_kinases"

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
