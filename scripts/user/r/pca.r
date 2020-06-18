library(readr)
library(tidyverse)
library(dplyr)

data <- read_csv("data/concrete.csv") %>%
  select(-c(id, slump, flow, compressive_strength))

pca_results <-data %>%  prcomp(center = T, scale = T)

pca_results %>% structure()
pca_results$sdev^2 # 4 PCs when using Kaiser-Guttman rule 
biplot(pca_results)
