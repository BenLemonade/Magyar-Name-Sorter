# Magyar-Name-Sorter: #
A set of scripts to import a .txt of names (Names.txt) that are listed line-by-line, sort the names by initial letter, then output it to an R script for visualization.


## R-SCRIPT IMPORTANT NOTES: ##

!! IF IT IS THE FIRST TIME RUNNING THIS SCRIPT, PLEASE INSTALL THE FOLLOWING LIBRARIES BY RUNNING THE FOLLOWING COMMANDS IN THE R-CONSOLE !!
#### NEED TO INSTALL PACKAGES: ####
>install.packages("plyr")

>install.packages("tidyverse")

>install.packages("xlsx")

### ABOUT R SCRIPT ###

The R script was designed to read information specifically from 'Sorted.txt' in the project file. The information is presented in the file as such:

"
Ü : 6 names
NULL LINE
Üdvöske, Üdvöske, Üne, Ünige, Ünőke, Üllő, ...
NULL LINE
NULL LINE
"

There is exactly 1 NULL line between the first two lines of info, follwed by two more NULL lines. This means when importing the information, R creates an extra set of vectors/rows that are empty. Initially, R will load this data into a matrix horizontally, with the headers being column 1, and each list being a row. Of course I could simply change the C# script (also in this project file) to remove one of the NULL lines after the list of elemnets, but this provided a nice challenge to overcome, as I had to remove every other column in a dynamic way. To adjust these, the matrix is transposed 90 clockwise, so that the first row is in essence the column headers, and each column its appropriate vector. Then every other column (empty columns, previously the empty rows) is removed by using a TRUE/FLASE vector to filter the matrix columns.

I feel this needed to be said, because the data structure isn't completely standard and it took me some time myself to understand how exactly R had built the matrix from the .txt. Some useful functions for understanding the structure of the matrix are:
>dim(matrix)		--Gives the dimensions of a table as (rows, cols)
>summary(data.type)	--Gives a summary of the data type variable
>head(matrix)		--Prints the first few rows of a table in
>matrix[[x]][y]		--Prints the Yth element of the Xth 'key'/'category'/'column' of a matrix
>array[x]		--Prints the Xth element of an array
>data.type		--Prints the data type