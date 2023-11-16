#####################################################
# Text data retrieval (single document): Retrieval
# Author: Haohan Chen
#####################################################

rm(list=ls())

library(tidyverse)
library(rvest) # This is one package that handles webpages retrieval and parsing
library(xml2) # This is another package that handles webpages retrieval and parsing

dir.create("data_1") # Create a new folder

## Retrieve CE's last article ====

download.file(
  url = "https://www.ceo.gov.hk/archive/5-term/eng/pdf/article20220530.pdf",
  destfile = "data_1/20220530.pdf")


## Retrieve CE's last speech ====

doc_html <- read_html("https://www.info.gov.hk/gia/general/202206/21/P2022062100598.htm")
write_html(doc_html, "data_1/20220621.htm")

## read_html function is available on both rvest and xml2 packages
## write_html function is only available on xml2 package