# loading libraries
library(data.table)
library(readr)
library(dplyr)
library(tidyverse)
library(tidyr)
library(countrycode)

# set the directory
setwd("/Users/ghazalayobi/France/University/BDMA/Visual Analytics Introduction/project/clean_data")

# loading the data
drug_consumtion <- readr::read_csv('https://raw.githubusercontent.com/ghazalayobi/CS-visual-analytics/main/assignment-3/data/Drug_Consumption.csv')

# converting to data tables
drug_consumtion <- as.data.table(drug_consumtion)
drug_consumtion <- drug_consumtion[drug_consumtion$Country != "Other", ]
drug_consumtion$iso3 <- countrycode(drug_consumtion$Country, "country.name", "iso3c")

drug_consumtion[drug_consumtion=="CL0"]="Never Used"
drug_consumtion[drug_consumtion=="CL1"]="Used over a Decade Ago"
drug_consumtion[drug_consumtion=="CL2"]="Used in Last Decade"
drug_consumtion[drug_consumtion=="CL3"]="Used in Last Year"
drug_consumtion[drug_consumtion=="CL4"]="Used in Last Month"
drug_consumtion[drug_consumtion=="CL5"]="Used in Last Week"
drug_consumtion[drug_consumtion=="CL6"]="Used in Last Week"




# getting directory 
getwd()

# saving the cvs
write.csv(drug_consumtion, 'drug_consumtion.csv')

# Loading the second dataset

drug_risk <- readr::read_csv('https://raw.githubusercontent.com/ghazalayobi/CS-visual-analytics/main/assignment-3/data/substances-risk-factor-vs-direct-deaths.csv')

drug_risk <- gather(drug_risk, condition, measurement, "Drug-use-disorders":"Alcohol-use", factor_key=TRUE)
write.csv(drug_risk, 'drug_risk.csv')


