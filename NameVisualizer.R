library(UTF-8)
setwd("Y:/Visual Studio for C#/Projects/Homework2-MagyarNameSorter/MagyarNameSorter/")

SortedNames <- NULL
SortedNames <- "Variable is createed, process is ready"

print(SortedNames)

SortedNames <- read.table("Sorted.txt" , header = FALSE, sep = "\t" , comment.char = " ", fileEncoding = UTF-8)

print(SortedNames)