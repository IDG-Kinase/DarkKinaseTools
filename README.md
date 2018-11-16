# DarkKinaseTools
Tools for Processing Dark Kinase Data

# Overview

This package will provide a set of shared tools to work with and analyze the members of the Dark Kinome. The initial goals are centralize the master list of Dark (and Light) Kinases and collect corresponding identifiers.

# Installation

This package can be installed using devtools:

``` r
install.packages('devtools')
devtools::install_github("IDG-Kinase/DarkKinaseTools")
```

# Usage

After calling "library(DarkKinaseTools)", several tables of data are made available:

* all_kinases: known kinases and corresponding identifiers
* dark_kinases: dark kinases and corresponding identifiers 
* mouse_human_gene_names: mouse kinases with links to human orthologs
* kin_domain_locations: location of kinase domains within proteins and overall protein lengths

Calling help on any of these table names will provide an explanation of each column.

# Data Sources/Production

All of the data processing steps are outlined in the "data-raw" directory in several R Markdown documents.
