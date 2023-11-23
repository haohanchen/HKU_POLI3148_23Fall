#####################################################
# Parse webpages
# Author: Haohan Chen
#####################################################

rm(list=ls())

library(tidyverse)
library(rvest)
library(xml2)

index_table_speech <- read_rds("Lec_10/2_Web_Scraping/data_2/index_speech.rds")

file_repo_in <- "Lec_10/2_Web_Scraping/data_2/raw_speech"
file_names <- list.files(file_repo_in)

file_repo_out <- "Lec_10/2_Web_Scraping/data_2/parsed_speech"
dir.create(file_repo_out)

ERROR <- c()

for (i in seq_along(file_names)){
  file_name_in <- file.path(file_repo_in, file_names[i])
  doc_html <- read_html(file_name_in)

  text_body <- doc_html %>%
    html_elements("#pressrelease") %>%
    html_text()
  
  if (is_empty(text_body)) {ERROR[i] <- TRUE} # Check if a parsing is successful
    
  file_name_out <- file.path(file_repo_out, str_c(file_names[i], ".txt"))
  write(text_body, file_name_out)

  message(i, " of ", length(file_names))
}


# Check which file fails to parse
which(ERROR == TRUE)

# Handle the error
# Start by manuall examining the downloaded webpage
i <- 291
file_name_in <- file.path(file_repo_in, file_names[i])
doc_html <- read_html(file_name_in)

text_body <- doc_html %>%
  html_elements("#content p") %>%
  html_text()

file_name_out <- file.path(file_repo_out, str_c(file_names[i], ".txt"))
write(text_body, file_name_out)
