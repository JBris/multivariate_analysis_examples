library(readr)
library(tidyverse)
library(dplyr)
library(vegan)

data <- read_csv("data/concrete.csv")  
X <- data %>% select(c("cement", "slag", "fly_ash", "water", "superplasticizer", "coarse_aggregate", "fine_aggregate"))
Y <- data %>% select(c("slump", "flow", "compressive_strength"))

concrete_cca <- data %>% cca(X, Y, scale = T)
concrete_cca %>% structure()
plot(concrete_cca)

concrete_rda <- data %>% rda(X, Y, scale = T)
concrete_rda %>% structure()
plot(concrete_rda)
