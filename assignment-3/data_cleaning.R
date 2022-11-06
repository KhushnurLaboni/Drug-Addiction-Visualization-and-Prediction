# loading libraries
library(data.table)
library(readr)
library(dplyr)
library(tidyverse)
library(tidyr)

# set the directory
setwd("/Users/ghazalayobi/France/University/BDMA/Visual Analytics Introduction/project/clean_data")

# loading the data
drug_consumtion <- readr::read_csv('https://raw.githubusercontent.com/KhushnurLaboni/Drug-Addiction-Visualization-and-Prediction/main/clean_data/Drug_Consumption.csv?token=GHSAT0AAAAAABZXY6M56EIAKC5AWYHTOYHCY3GYTQQ')

# converting to data tables
drug_consumtion <- as.data.table(drug_consumtion)
drug_consumtion <- drug_consumtion[drug_consumtion$Country != "Other", ]
drug_consumtion <- drug_consumtion[, iso3 := countrycode::countryname(Country,destination = "iso3")]

# getting directory 
getwd()

# saving the cvs
write.csv(drug_consumtion, 'drug_consumtion.csv')

# Loading the second dataset

drug_risk <- readr::read_csv('/Users/ghazalayobi/France/University/BDMA/Visual Analytics Introduction/project/clean_data/drug_risk.csv')

drug_risk <- gather(drug_risk, condition, measurement, "Drug-use-disorders":"Alcohol-use", factor_key=TRUE)
write.csv(drug_risk, 'drug_risk.csv')


