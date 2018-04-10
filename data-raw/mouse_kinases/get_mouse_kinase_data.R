library(data.table)
library(tidyverse)
library(here)

#This data set lists mouse kinases and several of their properties.
#I'm most interested in the mouse->human ortholog pairs where they exist.
if (! file.exists(here('data-raw/mouse_kinases/mouse_kinase_names.txt'))) {
  download.file('http://kinase.com/mouse/tables/Table2.txt',
                here('data-raw/mouse_kinases/mouse_kinase_names.txt'))
}
mouse_kinase_data = read_delim(here('data-raw/mouse_kinases/mouse_kinase_names.txt'),
                               delim = '\t');

#The kinase.com list does include MGI protein names (such as Ptk9), but some of
#these appear to be out of date. Assuming that the MGI Gene IDs (such as
#MGI:1100520) are still correct, I went to MGI's batch search tool
#(http://www.informatics.jax.org/batch), entered all the listed MGI IDs and
#saved the list back out. I'm not sure how to do this in R, so I'll leave this
#as a manual step.
mouse_MGI_info = read_delim(here('data-raw/mouse_kinases/MGIBatchReport_20180406_101248.txt'),
                            delim='\t') %>% select(Input,Symbol) %>%
  rename(Mouse_Gene_Symbol = Symbol)

#Add the Symbol data to the full mouse kinase set
mouse_kinase_data = left_join(mouse_kinase_data,mouse_MGI_info,
                              by=c("Jackson Labs MGI ID" = "Input"))

mouse_human_gene_names = mouse_kinase_data %>%
  filter(`Pseudogene?` != 'Yes') %>%
  select(Mouse_Gene_Symbol,'Human Ortholog') %>%
  rename(Human_ortholog = 'Human Ortholog')

devtools::use_data(mouse_human_gene_names, overwrite = TRUE)
