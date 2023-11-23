#####################################################
# Retrieve PDF documents (articles)
# Author: Haohan Chen
#####################################################

rm(list=ls())

library(tidyverse)
library(rvest)
library(xml2)

dir.create("Lec_10/2_Web_Scraping/data_2/raw_article")

# Retrieve multiple PDF files ====

index_table_article <- read_rds("Lec_10/2_Web_Scraping/data_2/index_article.rds")

ids <- index_table_article$uid
urls <- index_table_article$url

for (i in 1:5){ # To avoid crowding the server, I only scrape the first 5
  file_name_retrieved <- str_c("Lec_10/2_Web_Scraping/data_2/raw_article/", ids[i], ".pdf")
  download.file(urls[i], file_name_retrieved)

  Sys.sleep(0.5)
  message(i, " of ", length(urls))
}

