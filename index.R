#### simply tempogram ####

library(tempogram)
library(jsonlite)

tempo_data <- fromJSON("data/tempo_data.txt")

tempogram(toJSON(tempo_data))

tempogram(toJSON(tempo_data),
          colors = c("#FF5733",
                     "#33FF57",
                     "#337AFF",
                     "#FF33D4",
                     "#FFFF33",
                     "#4A90E2",
                     "#FFA500",
                     "#8A2BE2",
                     "#008000",
                     "#800000",
                     "#A52A2A"))
















