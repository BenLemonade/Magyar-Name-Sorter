## NEED TO INSTALL APPROPRIATE PACKAGES: ##
install.packages("plyr")
install.packages("tidyverse")
install.packages("xlsx")
install.packages("RColorBrewer")

################################################################################################################################################
########################################## Processing and visualizing data from 'Magyar Names Sorter' ##########################################
################################################################################################################################################
											By BenLemonade

############################################################# Setting Up Workspace #############################################################

## Set Work Directory: ##
setwd("Y:/Visual Studio for C#/Projects/Homework2-MagyarNameSorter/MagyarNameSorter/") 		## Set work directory to 'Magyar Name Sorter' project file ##
## Call Necessary Libraries ##
library(plyr)														## Call library 'plyr' ##
library(xlsx)														## Call libraries 'xlsx' ##
## Declare Data-Type Variables ##
SortedNames <- NULL													## Create variable 'Sorted Names' = NULL ##
LetterCategories <- NULL												## Create variable 'Letter Categories' = NULL ##
OrderedCols <- NULL													## Create variable 'Ordered Cols' = NULL ##
numbers <- c()														## Create variable 'numbers' = c(NULL) ##
letters <- c()														## Create variable 'letters' = c(NULL) ##
## Declare Iterator Variables ##
i <- 1															## Create variable 'i' = 1 ##
j <- 1															## Create variable 'j' = 1 ##


################################################ Importing and cleaning info from 'Sorted.txt' #################################################


## Read in 'Sorted.txt' and store into 'SortedNames' (This imports the data with the names in rows horizontally). Transpose the matrix so data is in columns, not rows. ##
SortedNames <- read.delim("Sorted.txt", header = FALSE, sep = ",", fileEncoding = "UTF-8", )	## Read 'Sorted.txt' into a matrix, separating by the comas ##
SortedNames <- t(SortedNames)												## Transpose the matrix ##
head(SortedNames)														## Prints top few rows of matrix to console ##


## Gets all of the items in the first row as 'Letter Categories', then only selects every other, storing only the "X : #". ##
LetterCategories <- c(SortedNames[1,])										## Store the first row of matrix 'Sorted Names' into array 'Letter Categories' ##
LetterCategories <- LetterCategories[c(TRUE,FALSE)]								## Every other column/element is empty, so remove every other element via [c(T,F)] ##


## Stores the matrix into 'Ordered Cols', and deletes every odd column (empty) ##
OrderedCols <- SortedNames												## Store 'Sorted Names' into 'Ordered Cols' ##
OrderedCols <- OrderedCols[,c(FALSE,TRUE)]									## Every other column/element is empty, so remove every other element via [c(T,F)] ##
head(OrderedCols)														## Gives summary of matrix ##
dim(OrderedCols)														## Gives dimesions of matrix ##


###		###		###		###		###		###

##### FOR FUTURE where I would like to store the elements of the matrix, and display some kind of data from that as well (like perhaps the lengths of names) #####
## Replace empty ("") cells with NA, allowing R to read the number of names in each column. ##
for (i in 1:length(OrderedCols)) {											## For each column in matrix 'Ordered Cols': ##
	for (j in 1:length(OrderedCols[[j,i]])) {									## For each cell in current column: ##
		if (is.null(OrderedCols[[j,i]])) {									## If cell has " " (empty): ##
			OrderedCols[[j,i]] <- ""									## Store NA into current cell ##
		}
	}
}
head(OrderedCols)														## Gives summary of matrix ##


############################################ Storing the amount of values in each key and plotting ##############################################


## Parse the characters of 'Letter Categories' and give back the number as an integer into a value vector, and the letters as a 'Key' vector ##
for (i in 1:length(LetterCategories)) {										## For each column in matrix 'Ordered Cols': ##
	Split1 <- strsplit(LetterCategories[i], ":")								## Split element of 'Letter Categories[i]' at ':' , store into 'Split 1' ##
	Split2 <- strsplit(LetterCategories[i], " ")								## Split once again, this time at the space " ", and store into 'Split 2' ##
	numbers <- append(numbers, as.numeric(Split2[[1]][3]))						## Store the 3rd value (the number) as an integer into 'Numbers' ##
	letters <- append(letters, (Split2[[1]][1]))								## Store the 1st value (the letter) into 'Letters' ##
}
numbers
letters

############################################## Plotting a Bar Chart of number of names by letter #################################################


pdf(file = "AmountOfNamesBARplot.pdf")
barplot(
	numbers, 														## A vector of values in integers to be displayed as bars ##
	names.arg = letters, 												## A vector of values to be displayed as labeles for the bars ##	
	xlab = "Starting Letter",											## The label for the x-axis ##
	ylab = "Number of Names",											## The label for the y-axis ##
	col = rainbow(31),												## The color of the bars ##
	border = "Blue",													## The color of the bar borders ##
	main = "Amount of Hungarian Names by Starting Letter",						## The title of the chart ##
	xpd = FALSE,													## The bars are NOT allowed to be taller than the y-axis (labels) ##
	horiz = FALSE,													## Defines if the bars are displayed horizontally or not ##
	axes = TRUE,													## Draws verticle axis (or horizontal if horiz=T) ##
	cex.axis = 1,													## Size of y-label text (more specifically numeric labels) ##
	cex.names = .5,													## Size of x-label text (more specifically character labels) ##
	space = .33,													## The amount of space between bars, as a fraction of the overall width of a bar ##
	
	#density = c(100),												## The 'density' of the color fill od the bars (line-shading) ##
	#angle = 25,													## The angles of the line-shading defined by 'density' ##
	#col = c("red","orange","yellow"),
	#col = brewer.pal(n=8, name="YlOrRd"),
	#xlim = c(1),
	#width = c(20),
	#ann = TRUE,
)
dev.off()

















