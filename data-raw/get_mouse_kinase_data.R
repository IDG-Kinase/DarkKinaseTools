library(data.table)
library(tidyverse)
library(here)

if (! exists('mouse_kinase_data.txt')) {
  download.file('http://kinase.com/mouse/tables/Table2.txt',here('mouse_kinase_data.txt'))
}
mouse_kinase_data = read_delim(here('mouse_kinase_data.txt'),delim = '\t');

mouse_human_gene_names = mouse_kinase_data %>%
  filter(`Pseudogene?` != 'Yes') %>%
  select('Gene Name','Human Ortholog') %>%
  rename(Mouse_gene_name = 'Gene Name', Human_ortholog = 'Human Ortholog')

devtools::use_data(mouse_human_gene_names, overwrite = TRUE)
