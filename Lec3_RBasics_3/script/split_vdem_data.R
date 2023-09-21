# Title: Split the VDEM data
# Purpose: The VDEM data is too big for GitHub upload (> 100M). 
#          I am splitting it into 8 chunks by the "Year" variable
#          so that students will have no problem copying them the splitted data
#          to their personal GitHub repo and push them online.
# Author: Haohan Chen



library(tidyverse)

d <- read_csv("data/raw_data/vdem/large_do_not_push_to_github/V-Dem-CY-Full+Others-v13.csv")

# List all years
Years <- sort(unique(d$year))

# Split Years into chunks
n_chunk <- 8 # Comes from some trial and error. This is the smallest N of batch to have <100M batches
splitter <- rep(1:n_chunk, each = ceiling(length(Years) / n_chunk))
splitter <- splitter[1:length(Years)]

Years_batch <- split(Years, splitter)

# Split the data
for (i in seq_along(Years_batch)){
  d_batch <- d |> filter(year %in% Years_batch[[i]])
  write_csv(d_batch, paste0("data/raw_data/vdem/", "vdem_", 
                            Years_batch[[i]][1], "_", rev(Years_batch[[i]])[1], 
                            ".csv"))
}
