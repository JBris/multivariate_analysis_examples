library(readr)
library(tidyverse)
library(dplyr)
library(psych)

data <- read_csv("data/concrete.csv") %>%
  select(-c(id, slump, flow, compressive_strength))

fa_results <-data %>% factanal(factors = 2, rotation = "promax")
fa_results %>% structure()
loadings <- fa_results$loadings[,1:2]
plot(loadings, type="n") 
text(loadings, labels=names(data), cex=.7) 