# Title: Split the VDEM data
# Purpose: The VDEM data is too big for GitHub upload (> 100M). 
#          I am splitting it into chunks by the "Year" variable
#          so that students will have no problem copying them 
#          to their personal GitHub repo and push them online.
#          In addition, merging the split data can practice data wrangling skills.
# Author: Haohan Chen


library(tidyverse)

d <- read_csv("_DataPublic_/vdem/large_do_not_push_to_github/V-Dem-CY-Full+Others-v13.csv")

# List all years
Years <- sort(unique(d$year))

# Split Years into chunks
n_chunk <- 6 # Comes from some trial and error. This is the smallest N of batch to have <100M batches
splitter <- rep(1:n_chunk, each = ceiling(length(Years) / n_chunk))
splitter <- splitter[1:length(Years)]

Years_batch <- split(Years, splitter)

# Get ID, Vdem and external variables

vnames_ls <- list()
vnames <- names(d)

vnames_ls[["id"]] <- vnames[1:22]
vnames <- vnames[!(vnames %in% vnames_ls[["id"]])]

vnames_ls[["external"]] <- vnames[str_detect(vnames, "^e_")]
vnames <- vnames[!(vnames %in% vnames_ls[["external"]])]

vnames_ls[["indoctrination"]] <- vnames[str_detect(vnames, "^v2[x|m]?ed")]
vnames <- vnames[!(vnames %in% vnames_ls[["indoctrination"]])]

vnames_ls[["historical"]] <- vnames[str_detect(vnames, "^v3")]
vnames <- vnames[!(vnames %in% vnames_ls[["historical"]])]

vnames_ls[["index"]] <- vnames[str_detect(vnames, "^v2x")]
vnames <- vnames[!(vnames %in% vnames_ls[["index"]])]

vnames_ls[["others"]] <- vnames

sum(sapply(vnames_ls, length))


# Split the data
for (i in seq_along(Years_batch)){
  year_range <- paste0(Years_batch[[i]][1], "_", rev(Years_batch[[i]])[1])
  path_folder <- paste0("_DataPublic_/vdem/", year_range)
  dir.create(path_folder)
  for (var_batch in names(vnames_ls)[-1]){
    d_batch <- d |> 
      select(vnames_ls[["id"]], vnames_ls[[var_batch]]) |>
      filter(year %in% Years_batch[[i]])
    path_file_csv <- paste0("_DataPublic_/vdem/", year_range, "/",
                        "vdem_", year_range, "_", var_batch, ".csv")
    write_csv(d_batch, path_file_csv)
  }
}
