#####################################################
# Retrieve webpages (speeches)
# Author: Haohan Chen
#####################################################

library(tidyverse)
library(rvest)
library(xml2)

dir.create("Lec_10/2_Web_Scraping/data_2/raw_speech")

index_table_speech <- read_rds("Lec_10/2_Web_Scraping/data_2/index_speech.rds")

# Some ad-hoc cleaning along the way. 
# Find a url that does not start with HTTP
index_table_speech %>% filter(!str_detect(url, "^http"))

index_table_speech <- index_table_speech %>%
  mutate(url = ifelse(!str_detect(url, "^http"),
                      str_c("https://www.ceo.gov.hk/archive/5-term/eng/", url),
                      url))

ids <- index_table_speech$uid
urls <- index_table_speech$url

for (i in 1:5){ # For demo purpose, I retrieve 5 only.
  doc_html <- read_html(urls[i])
  file_name_retrieved <- str_c("Lec_10/2_Web_Scraping/data_2/raw_speech/", ids[i], ".htm")
  write_html(doc_html, file_name_retrieved)

  Sys.sleep(0.5)
  message(i, " of ", length(urls))
}
