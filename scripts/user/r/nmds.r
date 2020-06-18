library(readr)
library(tidyverse)
library(dplyr)
library(vegan)

data <- read_csv("data/concrete.csv") %>%
  select(-c(id, slump, flow, compressive_strength))

corr <- cor(data)
nmds <- corr %>% metaMDS(distance = "bray", engine = "monoMDS")
nmds %>% structure()

stressplot(nmds)
ordiplot(nmds,type="n")
orditorp(nmds,display="sites",cex=1.25,air=0.01)
