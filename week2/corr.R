#set working directory
setwd("~/Documents/rprogcoursera/week2/")

#check if working directory is set correctly
getwd()
list.files()

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  if(grep("specdata", directory) == 1) 
  {
    directory <- ("./specdata/")
  } 
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
#merge all csv's into one big table & make some weird magic
  table <- complete("specdata", 1:332)
  nobs <- table$nobs
  ids <- table$id[nobs > threshold]
  id_lenght <- length(ids)
  corr_vector <- rep(0, id_lenght)

  files <- as.character(list.files(directory))
  paths <- paste(directory, files, sep="")
  j <- 1
  for(i in ids) {
    current_file <- read.csv(paths[i], header=T, sep=",")
#fiy about complete.obs: http://www.statmethods.net/stats/correlations.html
    corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
    j <- j + 1
  }
  corr <- corr_vector
  return(corr)   
}
