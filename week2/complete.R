#set working directory
setwd("~/Documents/rprogcoursera/week2/")

#check if working directory is set correctly
getwd()
list.files()

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # get the length of id vector
  id_length <- length(id)
  complete_data <- rep(0, id_length)

  files <- as.character( list.files(directory) )
  paths <- paste(directory, files, sep="")
  
  j <- 1 
  for (i in id) {
    current_file <- read.csv(paths[i], header=T, sep=",")
    complete_data[j] <- sum(complete.cases(current_file))
    j <- j + 1
  }
  complete_r <- data.frame(id = id, nobs = complete_data)
  return(complete_r)
} 

##-------------------------------------
##check if it works :)

# source("complete.R")
# complete("specdata", 1)
##   id nobs
## 1  1  117
# complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
# complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
# complete("specdata", 3)
##   id nobs
## 1  3  243