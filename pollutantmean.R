pollutantmean <- function(directory, pollutant, id = 1:332){
  
  ## 'directory' is a character vector of length 1 indicating the location of
  ## the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating the name of the
  ## pollutant for which we will calculate the mean; either 'sulfate' or
  ## 'nitrate'.
  
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  
  ## Return the mean of the pollutant across all monitors list in the 'id'
  ## vector (ignoring NA values)
  
  #get working dir
  wd <- getwd()
  
  #initialize empty vector for mean
  mean_vector <- numeric()
  filesDir <- paste(wd,"/",directory,"/",sep="")
  filesInDir <- list.files(filesDir)
  
  #finding all files present in directory
  allfiles <- paste(filesDir,filesInDir,sep="")
  
  #finding mean across all files
  for(i in id) {
    readFile <- read.csv(allfiles[i],header = TRUE,sep = ",",dec = ".")
    mean_vector <- c(mean_vector, readFile[[pollutant]])
  }
  
  round(mean(mean_vector, na.rm = TRUE),3)
}