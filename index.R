library(tempogram)
library(rjson)
library(jsonlite)

if (!require("ipumsr")) stop("Reading IPUMS data into R requires the ipumsr package. It can be installed using the following command: install.packages('ipumsr')")

ddi <- read_ipums_ddi("data/atus_00026(1).xml")
data <- read_ipums_micro(ddi)


tempo_data <- fromJSON("data/tempo_data.txt")

tempogram(toJSON(tempo_data))
