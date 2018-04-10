library(tidyverse)
library(readxl)
library(here)

###############################################################################
# Process Dark Kinase Excel List
###############################################################################

dark_kinase_list_raw = readxl::read_xlsx(here('data-raw/dark_kinases/Modified IDG Kinase List for NIH.xlsx'))

dark_kinase_list = dark_kinase_list_raw %>%
  filter(`Keep/Add` != 'Remove' | is.na(`Keep/Add`)) %>%
  filter(! is.na(`Approved name`)) %>%
  mutate(hgnc_symbol = `Approved name`) %>%
  rename(DRGC_symbol = `Approved name`) %>%
  #There is one symbol in the "Approved name" that isn't in the HGNC list:
  #SGK494, mark it as NA
  mutate(hgnc_symbol = case_when(
    hgnc_symbol == "SGK494" ~ "NA",
    TRUE ~ as.character(hgnc_symbol)
  )) %>%
  select(hgnc_symbol,DRGC_symbol)

devtools::use_data(dark_kinase_list, overwrite = TRUE)

###############################################################################
# Process Full List of Kinases
###############################################################################

###########################################################
# Kinase.com Kinase List
###########################################################
kinome_com_file = here('data-raw','dark_kinases','kinase.com_list.xls')
if (! file.exists(kinome_com_file)) {
  download.file('http://kinase.com/human/kinome/tables/Kincat_Hsap.08.02.xls',
                kinome_com_file);
}

kinase_com_list = readxl::read_xls(kinome_com_file);
#The list from Kinase.com has a set of psuedogenes at the end, which we won't work with
kinase_com_list = kinase_com_list %>% filter(`Pseudogene?` == "N")

#Several of the kinases listed have been assigned HGNC IDs
additional_hgncs = read.csv(here('data-raw','dark_kinases','additional_hgnc_IDs.csv'))
for (this_row_num in 1:dim(additional_hgncs)[1]) {
  this_row = additional_hgncs[this_row_num,]
  kinase_row = grep(this_row$kinase_name,kinase_com_list$Name)

  kinase_com_list$Entrez_dbXrefs[kinase_row] = paste0(this_row$HGNC.ID,"|",kinase_com_list$Entrez_dbXrefs[kinase_row])
}

full_kinase_list = kinase_com_list %>%
  select(Name,Entrez_dbXrefs);

###########################################################
# HGNC Protein List
###########################################################

hgnc_protein_file = here('data-raw','dark_kinases','hgnc_complete_set.txt')
if (! file.exists(hgnc_protein_file)) {
  download.file('ftp://ftp.ebi.ac.uk/pub/databases/genenames/new/tsv/hgnc_complete_set.txt',
                hgnc_protein_file);
}

#Toss out entries which have been withdrawn from the database
HGNC_list = read.delim(hgnc_protein_file) %>%
  filter(status != "Entry Withdrawn");

#Filtering out the HGNC IDs from the kinase.com list, thankfully the format of the ID is identical to that used on the HGNC
HGNC_Kinase_IDs = str_match(kinase_com_list$Entrez_dbXrefs,"HGNC:[:digit:]+")

#Two kinases lack HGNC ids: SgK494/SgK424, so they won't make it through the
#HGNC ID filter. In addition we added several pseudokinases to the list, so they
#should also make it to the master list, add them in with a filter check.

HGNC_Kinases_Full = HGNC_list %>%
  filter(hgnc_id %in% HGNC_Kinase_IDs |
         symbol %in% dark_kinase_list$hgnc_symbol)

HGNC_list = HGNC_list %>%
  mutate(is_kinase = hgnc_id %in% HGNC_Kinase_IDs | symbol %in% dark_kinase_list$hgnc_id)

#Add the Light/Dark Classification to HGNC_kinases and select only a few columns
HGNC_Kinases = HGNC_Kinases_Full %>% mutate(
  class = case_when(
    symbol %in% dark_kinase_list$Kinase ~ "Dark",
    TRUE ~ "Light"
  )
) %>% select(c("hgnc_id","symbol","ensembl_gene_id","class"))
