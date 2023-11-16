##################################################################
# Text data collection (multiple document): Clean the index table
# Author: Haohan Chen
##################################################################

rm(list=ls())

library(tidyverse)
library(rvest)
library(xml2)


# Load our index table ====
index_table <- read_rds("data_2/index_all.rds")
print(index_table)


# Separate PDF and HTML documents ====

index_table_article <- index_table %>%
  filter(str_detect(title, "Article by CE"))

index_table_speech <- index_table %>%
  filter(str_detect(title, "Speech by CE"))

# Check if it covers all
nrow(index_table_article) + nrow(index_table_speech)
nrow(index_table)

# No. It does not. Check what are missing and revise the conditions
index_table_miss <- index_table %>%
  anti_join(index_table_article) %>%
  anti_join(index_table_speech)

head(index_table_miss)

# Examine the tables of missing documents and revise the conditions
# Let's do match by title (revised)
index_table_article <- index_table %>%
  filter(str_detect(title, "Article by CE") |
           str_detect(title, "Opening remarks by the Chief Executive at the Legislative Council Question and Answer Session")|
           str_detect(title, "CE's letter to Hong Kong citizens"))

index_table_speech <- index_table %>%
  filter(str_detect(title, "Speech by CE") |
           str_detect(title, "CE's speech") |
           str_detect(title, "Speech by Acting") |
           str_detect(title, "New year message") |
           str_detect(title, "CE speaks") |
           str_detect(title, "Eulogy by CE") |
           str_detect(title, "Transcript of remarks by CE") |
           str_detect(title, "Video message by CE at United Nations Human Rights Council meeting") |
           str_detect(title, "Opening remarks by CE at press conference in Thailand"))

index_table_miss <- index_table %>%
  anti_join(index_table_article) %>%
  anti_join(index_table_speech)


# We can change a condition and make things much easier!

index_table_article <- index_table %>%
  filter(str_detect(url, ".pdf"))

index_table_speech <- index_table %>%
  filter(str_detect(url, ".htm"))

index_table_miss <- index_table %>%
  anti_join(index_table_article) %>%
  anti_join(index_table_speech)

# Examine the URLs and see if they all look right ====

## Open the tables and check
## Problem detected: Links to PDF files incomplete.

# Turn relative links to PDF files to absolute links ====

index_table_article <- index_table_article %>%
  mutate(url = str_c("https://www.ceo.gov.hk/archive/5-term/eng/", url))

# Finalize the index files ====

## Add an unique identifier to each document
index_table_speech <- index_table_speech %>%
  mutate(uid = str_c("S", row_number()), .before = date_of_speech)

index_table_article <- index_table_article %>%
  mutate(uid = str_c("A", row_number()), .before = date_of_speech)

# Save the files
write_rds(index_table_speech, "data_2/index_speech.rds")
write_rds(index_table_article, "data_2/index_article.rds")

