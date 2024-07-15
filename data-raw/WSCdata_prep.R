## code to prepare `WSCdata` dataset goes here

WSCdata <- read.csv("./data-raw/df2200_cleaned.csv")
usethis::use_data(WSCdata, overwrite = TRUE)

AMASdata <- read.csv("./data-raw/fin_amas.csv")
usethis::use_data(AMASdata, overwrite = TRUE)

BDIdata <- read.csv("./data-raw/fin_bdi.csv")
usethis::use_data(BDIdata, overwrite = TRUE)

Big5data <- read.csv("./data-raw/fin_big5.csv")
usethis::use_data(Big5data, overwrite = TRUE)

GSESdata <- read.csv("./data-raw/fin_gses.csv")
usethis::use_data(GSESdata, overwrite = TRUE)

MCSdata <- read.csv("./data-raw/fin_mcs.csv")
usethis::use_data(MCSdata, overwrite = TRUE)
