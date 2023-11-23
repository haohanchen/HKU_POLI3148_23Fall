#####################################################
# Parse PDF documents
# Author: Haohan Chen
#####################################################

rm(list=ls())

library(tidyverse)
library(pdftools)

index_table_article <- read_rds("Lec_10/2_Web_Scraping/data_2/index_article.rds")

file_repo_in <- "Lec_10/2_Web_Scraping/data_2/raw_article"
file_names <- list.files(file_repo_in)

file_repo_out <- "Lec_10/2_Web_Scraping/data_2/parsed_article"
dir.create(file_repo_out)

i <- 1
for (i in seq_along(file_names)){
  file_name_in <- file.path(file_repo_in, file_names[i])
  file_name_out <- file.path(file_repo_out, str_c(file_names[i], ".txt"))
  pdf_parsed <- pdf_text(file_name_in)
  write(pdf_parsed, file_name_out)
  message(i, " of ", length(file_names))
}

