#### simply tempogram ####

library(tempogram)
library(rjson)
library(jsonlite)

tempo_data <- fromJSON("data/tempo_data.txt")

tempogram(toJSON(tempo_data))

















