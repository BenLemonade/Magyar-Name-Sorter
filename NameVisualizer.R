################################################################################################################################################
########################################## Processing and visualizing data from 'Magyar Names Sorter' ##########################################
################################################################################################################################################

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


################################################ Importing and cleaning info from 'Sorted.txt' #################################################

## TEST var: 'SortedNames' ##
SortedNames <- "Variable is createed, process is ready"
print(SortedNames)

## Read in 'Sorted.txt' and store into 'SortedNames' (This imports the data with the names in rows horizontally) ##
SortedNames <- read.delim("Sorted.txt", header = FALSE, sep = ",")

## Transpose the chart so that the data is now displayed in columns, and store back into 'SortedNames' ##
SortedNames <- t(SortedNames)

LetterCategories <- c(SortedNames)

SortedNames[1,1]
SortedNames[1,3]
SortedNames[1,5]


for(col in SortedNames)
{
	
}
summary(SortedNames)





