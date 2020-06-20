library(readr)
library(tidyverse)
library(dplyr)
library(caret)
library(pls)

data <- read_csv("data/concrete.csv")  
data_noid <- data %>% select(-c("id"))

concrete_plr <- plsr(
  slump + flow +  compressive_strength ~ ., 
  data = data_noid, 
  validation = "LOO", 
  center = T, 
  scale = T
) 

cv = RMSEP(concrete_plr)
dims <- which.min(cv$val[estimate = "adjCV", , ]) - 1
concrete_plr <- plsr(
  slump + flow +  compressive_strength ~ ., 
  data = data_noid, 
  center = T, 
  scale = T,
  ncomp = dims,
) 

coefficients = coef(concrete_plr)
sum.coef = sum(sapply(coefficients, abs))
coefficients = coefficients * 100 / sum.coef
coefficients = sort(coefficients[, 1 , 1])
barplot(tail(coefficients, 4))
barplot(head(coefficients, 3))
