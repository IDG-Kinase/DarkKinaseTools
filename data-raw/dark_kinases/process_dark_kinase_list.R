library(readxl)
library(here)

kinase_list_excel = readxl::read_xlsx(here('data-raw/dark_kinases/Modified IDG Kinase List for NIH.xlsx'))

dark_kinase_list = kinase_list_excel %>%
  filter(`Keep/Add` != 'Remove' | is.na(`Keep/Add`)) %>%
  filter(! is.na(`Approved name`)) %>%
  rename(hgnc_id = `Approved name`) %>%
  select(hgnc_id)

devtools::use_data(dark_kinase_list, overwrite = TRUE)
