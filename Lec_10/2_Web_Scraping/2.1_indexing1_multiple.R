#####################################################
# Text data collection (multiple document): Indexing
# Author: Haohan Chen
#####################################################

rm(list=ls())

library(tidyverse)
library(rvest)
library(xml2)

dir.create("data_2")

# Retrieve the index page ====

html_index <- read_html("https://www.ceo.gov.hk/archive/5-term/eng/speech.html")

print(html_index)


# Get speech items on the index page ====

html_speeches_articles <- html_index %>% html_elements(".col-md-1+ td")

# We get a list of 60 elements (Each element containing speeches of a month)
typeof(html_speeches_articles)
length(html_speeches_articles)

# See what they look like
print(html_speeches_articles)


# Get URLs of speeches ====

urls <- html_speeches_articles %>% 
  html_elements("a") %>% # This is a typical HTML tag for a link
  html_attr("href") # This is the attribute of a link containing the URL

print(urls)

# Get titles of speeches ====

titles <- html_speeches_articles %>% 
  html_elements("a") %>%
  html_text() # Still, get the text
print(titles)


# Get dates of speeches ====

# Need another SelectorGadget run.

html_dates <- html_index %>% html_elements(".col-md-1")
dates <- html_dates %>% html_text()

length(dates)
print(dates)

# Putting everything into one table ====

index_table <- tibble(
  date_of_speech = dates,
  title = titles,
  url = urls
)

print(index_table)

write_csv(index_table, "data_2/index_all.csv") # Save data in CSV format
write_rds(index_table, "data_2/index_all.rds") # Save data in RDS format

