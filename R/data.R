#' Human Dark Kinases
#'
#' A dataset containing a list of dark kinases.
#'
#' @format A data frame with 162 rows and 9 columns
#' \describe{
#'   \item{hgnc_id}{The ID number assigned by HGNC, formated as HGNC:#####}
#'   \item{symbol}{The human dark kinase name in HGNC}
#'   \item{ensembl_gene_id}{The ID assigned by ensembl, all start with ENSG}
#'   \item{class}{Either Light or Dark, using the IDG classifications}
#'   \item{name}{A slightly longer name/description for the gene from HGNC}
#'   \item{uniprot_ids}{Uniprot identifiers the gene}
#'   \item{entrez_id}{Entrez ID from NCBI}
#'   \item{alias_symbol}{Collection of alternative symbols from HGNC, formated to work (at least partially, watch for edge cases) in a regular expression}
#'   \item{kinase_com_name}{Identifier used in the kinase.com list of human kinases}
#' }
#' @source NIH and the Dark Kinase DRGC
"dark_kinases"

#' All Human Kinases
#'
#' A dataset containing a list of human kinases. This list has several
#' pseudokinases, as they are included in the dark kinase list.
#'
#' @format A data frame with 575 rows and 9 columns
#' \describe{
#'   \item{hgnc_id}{The ID number assigned by HGNC, formated as HGNC:#####}
#'   \item{symbol}{The human dark kinase name in HGNC}
#'   \item{ensembl_gene_id}{The ID assigned by ensembl, all start with ENSG}
#'   \item{class}{Either Light or Dark, using the IDG classifications}
#'   \item{name}{A slightly longer name/description for the gene from HGNC}
#'   \item{uniprot_ids}{Uniprot identifiers the gene}
#'   \item{entrez_id}{Entrez ID from NCBI}
#'   \item{alias_symbol}{Collection of alternative symbols from HGNC, formated to work (at least partially, watch for edge cases) in a regular expression}
#'   \item{kinase_com_name}{Identifier used in the kinase.com list of human kinases}
#' }
#' @source NIH, the Dark Kinase DRGC, HGNC and kinase.com
"all_kinases"

#' Mouse Kinases and Corresponding Human Orthologs
#'
#' A dataset containing a list of mouse kinases and human orthologs, if present.
#' This list is mostly from the kinase.com website with the pseudogenes removed
#' and the mouse gene names updated to match the current listing in the Jackson
#' Labs MGI data.
#'
#' @format A data frame with 463 rows and 2 columns
#' \describe{
#'   \item{MGI_symbol}{The kinase symbol from the MGI database}
#'   \item{kinase_com_human_orthlog}{The corresponding human ortholog from kinase.com if identified}
#' }
#' @source \url{http://kinase.com/mouse/} and the MGI database
"mouse_human_gene_names"


#' Human Kinase Domain Locations
#'
#' A dataset containing a list of human kinase domain start and stop locations.
#' The start and stop locations are coded by the position within the kinase, so
#' a 250 amino acid kinase domain might start at position 200 and continue to
#' position 450. The undocumented columns in this data set are identical to the
#' data in the all_kinases data set. I found it convenient to have these
#' additional identifiers here as well.
#'
#' @format A data frame with 516 rows and 8 columns
#' \describe{
#'   \item{kinase_com_name}{The name used on the kinase.com list, used for cross-referencing other lists from kinase.com}
#'   \item{start}{First amino acid in the kinase domain}
#'   \item{stop}{Last amino acid in the kinase domain}
#'   \item{protein_length}{Number of Amino Acids in this protein}
#'   \item{hgnc_id}{The ID number assigned by HGNC, formated as HGNC:#####}
#'   \item{symbol}{The human dark kinase name in HGNC}
#'   \item{ensembl_gene_id}{The ID assigned by ensembl, all start with ENSG}
#'   \item{class}{Either Light or Dark, using the IDG classifications}
#' }
#' @source \url{http://kinase.com/}
"kin_domain_locations"
