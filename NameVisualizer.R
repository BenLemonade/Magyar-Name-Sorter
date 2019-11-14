## NEED TO INSTALL APPROPRIATE PACKAGES: ##
install.packages("plyr")
install.packages("tidyverse")
install.packages("xlsx")

################################################################################################################################################
########################################## Processing and visualizing data from 'Magyar Names Sorter' ##########################################
################################################################################################################################################
											By BenLemonade

############################################################# Setting Up Workspace #############################################################

## Set work directory to 'Magyar Name Sorter' project file ##
setwd("Y:/Visual Studio for C#/Projects/Homework2-MagyarNameSorter/MagyarNameSorter/")

## Call necessary libraries ##
library(plyr)
library(xlsx)

## Create needed variables ##
SortedNames <- NULL
LetterCategories <- NULL
OrderedCols <- NULL

i <- NULL
j <- NULL

################################################ Importing and cleaning info from 'Sorted.txt' #################################################


## Read in 'Sorted.txt' and store into 'SortedNames' (This imports the data with the names in rows horizontally). Transpose the matrix so data is in columns, not rows. ##
SortedNames <- read.delim("Sorted.txt", header = FALSE, sep = ",", )
SortedNames <- t(SortedNames)
summary(SortedNames)		#Gives summary of matrix


## Gets all of the items in the first row as 'Letter Categories', then only selects every other, storing only the "X : #" ##
LetterCategories <- c(SortedNames[1,])
LetterCategories <- LetterCategories[c(TRUE,FALSE)]
print(LetterCategories)		#Prints vector of category names (soon to be col names)


## Stores the matrix into 'Ordered Cols', and deletes every odd column (empty) ##
OrderedCols <- SortedNames
OrderedCols <- OrderedCols[,-c(1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47,49,51,53,55,57,59,61)]
summary(OrderedCols)


## For each column in matrix 'Ordered Cols': ##
for (i in 1:length(OrderedCols[i]))
{
	## For each cell in current column: ##
	for (j in 1:length(OrderedCols$i[j]))
	{
		## If cell has " : 1" in the string: ##
		if (as.str(substr(OrderedCols$i[j]))) == ": 1"
		{
			## Split string at ':1' and return first substring. ##
			str_split(OrderedCols$i[j], ":1", n = 1) 
		}
		## Else the cell is empty: ##
		else ()
		{
			## Replace " " with NA.
			
		}
	}
}





