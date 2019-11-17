### Magyar-Name-Sorter: ###
A set of scripts to import a .txt of names (Names.txt) that are listed line-by-line, sort the names by initial letter, then output it to an R script for visualization.


## R-SCRIPT IMPORTANT NOTES: ##

!! IF IT IS THE FIRST TIME RUNNING THIS SCRIPT, PLEASE INSTALL THE FOLLOWING LIBRARIES BY RUNNING THE FOLLOWING COMMANDS IN THE R-CONSOLE !!
# NEED TO INSTALL PACKAGES: #
>install.packages("plyr")
>install.packages("tidyverse")
>install.packages("xlsx")

The R script was designed to read information specifically from 'Sorted.txt' in the project file. The information is presented in there as such:

"

Ü : 6 names

Üdvöske, Üdvöske, Üne, Ünige, Ünőke, Üllő, 



"

With exactly 1 line between the two lines of info, follwed by two more empty lines. This means when importing the information, R creates an extra set of vectors/rows that are empty. Initially, R will load this data into a matrix horizontally, with the headers being column 1,
and each list being a row. To adjust this, the matrix is transposed 90 clockwise, so that the first row is in essence the column headers, and each column its' appropriate vector. Then every other column (empty, previously the empty rows) is removed.
I feel this needed to be said, because the data structure isn't completely standard and it took me some time myself to understand how exactly R had built the matrix from the .txt.

