##################################################################
# Text data collection (multiple document):
# Put retrieved and parsed documents into a table
# Author: Haohan Chen
##################################################################

rm(list=ls())

library(tidyverse)

# Load all text files from articles ====

filenames_a <- list.files("data_2/parsed_article")
text_a <- rep(NA, length(filenames_a)) # Initiate an empty vector to store texts
for (i in 1:length(filenames_a)){
  text_a[i] <- read_file(str_c("data_2/parsed_article/", filenames_a[i]))
}

d_text_a <- tibble(
  filename = filenames_a,
  text = text_a
  ) %>%
  mutate(uid = str_sub(filename, 1, -5), .after = filename)


# Load all text files from speeches ====

filenames_s <- list.files("data_2/parsed_speech")
text_s <- rep(NA, length(filenames_s))
for (i in 1:length(filenames_s)){
  text_s[i] <- read_file(str_c("data_2/parsed_speech/", filenames_s[i]))
}

d_text_s <- tibble(
  filename = filenames_s,
  text = text_s
) %>%
  mutate(uid = str_sub(filename, 1, -5), .after = filename)


# Combine the two datasets ====

d_text_all <- d_text_a %>% bind_rows(d_text_s)

# Load metadata of text ====

d_meta_a <- read_rds("data_2/index_article.rds")
d_meta_s <- read_rds("data_2/index_speech.rds")

d_meta_all <- d_meta_a %>% bind_rows(d_meta_s)

# Merge with the retrieved and parsed text dataset ====

d_FINAL <- d_meta_all %>% 
  inner_join(d_text_all, by = "uid")

dir.create("data_out")
write_rds(d_FINAL, "data_out/data_ce_speech_article.rds")

# Check the merged dataset ====

rm(list = ls())

d_raw <- read_rds("data_out/data_ce_speech_article.rds")

# Check document lengths (quite long, no NA. Looks alright.)
summary(nchar(d_raw$text))
