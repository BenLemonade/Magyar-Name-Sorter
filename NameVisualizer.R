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

i <- 1
j <- 1
numbers <- c()


################################################ Importing and cleaning info from 'Sorted.txt' #################################################


## Read in 'Sorted.txt' and store into 'SortedNames' (This imports the data with the names in rows horizontally). Transpose the matrix so data is in columns, not rows. ##
SortedNames <- read.delim("Sorted.txt", header = FALSE, sep = ",", )
SortedNames <- t(SortedNames)								## Transpose the matrix ##
head(SortedNames)										## Gives top few rows of matrix ##


## Gets all of the items in the first row as 'Letter Categories', then only selects every other, storing only the "X : #". ##
LetterCategories <- c(SortedNames[1,])
LetterCategories <- LetterCategories[c(TRUE,FALSE)]
print(LetterCategories)									## Prints vector of category names (soon to be col names) ##


## Stores the matrix into 'Ordered Cols', and deletes every odd column (empty) ##
OrderedCols <- SortedNames
OrderedCols <- OrderedCols[,-c(1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47,49,51,53,55,57,59,61)]
head(OrderedCols)										## Gives summary of matrix ##
dim(OrderedCols)										## Gives dimesions of matrix ##


## Replace empty ("") cells with NA, allowing R to read the number of names in each column. ##
for (i in 1:length(OrderedCols)) {							## For each column in matrix 'Ordered Cols': ##
	for (j in 1:length(OrderedCols[[j,i]])) {					## For each cell in current column: ##
		if (is.null(OrderedCols[[j,i]])) {					## If cell has " " (empty): ##
			OrderedCols[[j,i]] <- ""					## Store NA into current cell ##
		}
	}
}
head(OrderedCols)										## Gives summary of matrix ##


############################################# Storing the amount of values in each key and plotting ###############################################


## Parse the characters of 'Letter Categories' and give back the number as an integer into a value vector, and the letters as a 'Key' vector ##
for (i in 1:length(LetterCategories)) {						## For each column in matrix 'Ordered Cols': ##
	Split1 <- strsplit(LetterCategories[i], ":")				## Split element of 'Letter Categories[i]' at ':' , store into 'Split 1' ##
	Split2 <- strsplit(LetterCategories[i], " ")				## Split once again, this time at the space " ", and store into 'Split 2' ##
	numbers <- append(numbers, as.numeric(Split2[[1]][3]))		## Store the 3rd value (the number) as an integer into 'JustNumber' ##
}

numbers

barplot(numbers, names.arg=LetterCategories, xlab="Starting Letter", ylab="Number of Names", col="blue", main="Amount of Hungarian Names by Starting Letter")







