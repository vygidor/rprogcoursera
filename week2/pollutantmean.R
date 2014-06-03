#set working directory
setwd("~/Documents/rprogcoursera/week2/")

#check if working directory is set correctly
getwd()
list.files()

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  if(grep("specdata", directory) == 1) 
  {
    directory <- ("./specdata/")
  }
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  c_mean <- c()
  
  files <- as.character(list.files(directory))
  paths <- paste(directory, files, sep="")
  
  for(i in id) {
    current_file <- read.csv(paths[i], header=T, sep=",")
    head(current_file)
    pollutant
    ignore_na <- current_file[!is.na(current_file[, pollutant]), pollutant]
    c_mean <- c(c_mean, ignore_na)
  }
  
  pollutantmean_r <- mean(c_mean)
  return(round(pollutantmean_r, 3))
}


##-------------------------------------
##check if it works :)

# source("pollutantmean.R")
# pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064
# pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706
# pollutantmean("specdata", "nitrate", 23)
## [1] 1.281
