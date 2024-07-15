## code to prepare `WSCdata` dataset goes here

WSCdata <- read.csv("./data-raw/df2200_cleaned.csv")
usethis::use_data(WSCdata, overwrite = TRUE)


