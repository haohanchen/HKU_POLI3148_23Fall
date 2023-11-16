#####################################################
# Text data parsing (single document): parsing
# Author: Haohan Chen
#####################################################

rm(list=ls())

library(tidyverse)
library(rvest)
library(xml2)

library(pdftools)

# Parse a PDF document ====

## Function to parse a PDF file
pdf_parsed <- pdf_text("data_1/20220530.pdf")
pdf_parsed

## It returns a vector of 8 elements. Why 8? 8 pages! Each page is put in a 
## separate element.
length(pdf_parsed)

## Save the file into a .txt file (a text document)
write(pdf_parsed, file = "data_1/20220530_parsed.txt")


# Parse a webpage ====

## Load the HTML file
doc_html <- read_html("data_1/20220621.htm")
typeof(doc_html)
class(doc_html)

## Check what it looks like again
print(doc_html)

## Lazy parsing ====
## Just get all the text
html_parsed <- html_text(doc_html) # Blindly retrieve all the text form the webpage
print(html_parsed)
write(html_parsed, "data_1/20220621_parsed_lazy.txt")

## Precise parsing ====

### Step 1: Use SelectGadget to locate the content of interest

### Step 2: Use R to locate the section
text_all <- doc_html %>%
  html_elements("#contentBody") %>%
  html_text()

text_title <- doc_html %>%
  html_elements("#PRHeadlineSpan") %>%
  html_text()

text_body <- doc_html %>%
  html_elements("#pressrelease") %>%
  html_text()

### Step 3: Save the results

write(text_all, "data_1/20220621_parsed_all.txt")
write(text_title, "data_1/20220621_parsed_title.txt")
write(text_body, "data_1/20220621_parsed_body.txt")


