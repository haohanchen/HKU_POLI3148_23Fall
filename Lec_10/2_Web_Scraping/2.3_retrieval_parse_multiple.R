#####################################################
# Text data collection (multiple document): Retrieval
# Author: Haohan Chen
#####################################################

rm(list=ls())

library(tidyverse)
library(rvest)
library(xml2)

dir.create("data_2/raw_speech")
dir.create("data_2/raw_article")
dir.create("data_2/parsed_speech")
dir.create("data_2/parsed_article")


# Retrieve multiple PDF files ====

index_table_article <- read_rds("data_2/index_article.rds")

ids <- index_table_article$uid
urls <- index_table_article$url

for (i in 1:length(ids)){
  # Retrieval
  file_name_retrieved <- str_c("data_2/raw_article/", ids[i], ".pdf")
  download.file(urls[i], file_name_retrieved)
  
  # Parsing
  file_name_parsed <- str_c("data_2/parsed_article/", ids[i], ".txt")
  pdf_parsed <- pdf_text(file_name_retrieved)
  write(pdf_parsed, file_name_parsed)
  
  Sys.sleep(0.5)
  message(i, " of ", length(urls))
}


# Retrieve multiple webpages ====

rm(list = ls())

index_table_speech <- read_rds("data_2/index_speech.rds")

# Some ad-hoc cleaning along the way.
# Find a url that does not start with HTTP. Try what it is
index_table_speech %>%
  filter(!str_detect(url, "^http"))

index_table_speech <- index_table_speech %>%
  mutate(url = ifelse(!str_detect(url, "^http"),
                      str_c("https://www.ceo.gov.hk/archive/5-term/eng/", url),
                      url))


ids <- index_table_speech$uid
urls <- index_table_speech$url



for (i in 67:length(ids)){ # For demo purpose, I retrieve 5 only.
  # Retrieval
  doc_html <- read_html(urls[i])
  file_name_retrieved <- str_c("data_2/raw_speech/", ids[i], ".htm")
  write_html(doc_html, file_name_retrieved)
  
  # Parsing
  text_body <- doc_html %>%
    html_elements("#pressrelease") %>%
    html_text()
  file_name_parsed <- str_c("data_2/parsed_speech/", ids[i], ".txt")
  write(text_body, file_name_parsed)
  
  Sys.sleep(0.5)
  message(i, " of ", length(urls))
}

# Redo S68. (An ad hoc collection)
i <- 68
doc_html <- read_html(urls[i])

text_body <- doc_html %>%
  html_elements("#content p") %>%
  html_text()
file_name_parsed <- str_c("data_2/parsed_speech/", ids[i], ".txt")
write(text_body, file_name_parsed)
