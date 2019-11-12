################################################################################################################################################
########################################## Processing and visualizing data from 'Magyar Names Sorter' ##########################################
################################################################################################################################################
											By BenLemonade

############################################################# Setting Up Workspace #############################################################

## Set work directory to 'Magyar Name Sorter' project file ##
setwd("Y:/Visual Studio for C#/Projects/Homework2-MagyarNameSorter/MagyarNameSorter/")

## Install necessary libraries ##
install.packages("plyr")
install.packages("tidyverse")

## Call necessary libraries ##
library(plyr)
library(tidyverse)

## Create needed variables ##
SortedNames <- NULL
LetterCategories <- NULL

################################################ Importing and cleaning info from 'Sorted.txt' #################################################

## TEST var: 'SortedNames' ##
SortedNames <- "Variable is createed, process is ready"
print(SortedNames)

## Read in 'Sorted.txt' and store into 'SortedNames' (This imports the data with the names in rows horizontally) ##
SortedNames <- read.delim("Sorted.txt", header = FALSE, sep = ",", )

## Transpose the chart so that the data is now displayed in columns, and store back into 'SortedNames' ##
SortedNames <- t(SortedNames)
summary(SortedNames)	#Gives summary of matrix

## Gets all of the items in the first row as 'Letter Categories', then only selects every other, storing only the "X : #" ##
LetterCategories <- c(SortedNames[1,])
LetterCategories <- LetterCategories[c(TRUE,FALSE)]
print(LetterCategories)


dat2 <- read.csv("data2.csv", header=T, na.strings=c("","NA"))


ColCounter <- c("V1","V3","V5","V6","V7","V8","V9","V11","V13","V15","V17","V19","V21","V23","V25","V27","V29","V31","V33","V35","V37","V39","V41","V43","V45","V47","V49","V51","V53","V55","V57","V59","V61")

OrderedCols <- SortedNames
OrderedCols <- OrderedCols[,!names(OrderedCols) %in% ColCounter]

summary(OrderedCols)

print(OrderedCols)
dim(OrderedCols)
class(OrderedCols)

OrderedCols <- SortedNames








