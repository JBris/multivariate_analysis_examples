## multivariate_analysis_examples

## Table of Contents  

* [Introduction](#introduction)<a name="introduction"/>
* [Data](#data)<a name="data"/>
* [Methods](#methods)<a name="methods"/>
* [References](#references)<a name="references"/>

### Introduction

This repo contains several examples of multivariate techniques implemented in R, Python, and SAS. 

The multivariate concrete dataset was retrieved from https://archive.ics.uci.edu/ml/datasets/Concrete+Slump+Test. Credit to Professor I-Cheng Yeh.

### Data

[A local copy of the dataset can be found here.](scripts/user/data)

There are 103 observations. Each observation represents a batch of concrete ingredient measurements and test results.

There are 7 predictors and 3 response variables. All predictors are measured in kgs/m<sup>3</sup>. Slump and Flow are measured in cm, while Compressive Strength is measured in MPa.

All variables are continuous. Unfortunately, this rules out the use of LDA, QDA, MANOVA, MANCOVA, correspondence analysis etc.

### Methods

This repo contains several implementations of:

* PCA
* Factor Analysis 
* NMDS
* Canonical Correlation Analysis and Redundancy Analysis
* PLS Regression

[The R directory can be found here.](scripts/user/r)

[The Python directory can be found here.](scripts/user/python)

[The SAS directory can be found here.](scripts/user/sas)

### References

*Yeh, I-Cheng, "Modeling slump flow of concrete using second-order regressions and artificial neural networks," Cement and Concrete Composites, Vol.29, No. 6, 474-480, 2007*
