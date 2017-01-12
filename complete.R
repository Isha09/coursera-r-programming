complete <- function(directory, id = 1:332){
  ## 'directory' is a character vector of length 1 indicating the location of
  ## the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  
  ## Return a data frame of the form: id nobs 1 117 2 1041 ...  where 'id' is
  ## the monitor ID number and 'nobs' is the number of complete cases
  
  allfiles <- list.files(path = directory, pattern = ".csv" , full.names = TRUE)
  
  ## intializing empty numeric vector
  nobs = numeric()
  
  for(ids in id){
    readFile <- read.csv(allfiles[ids],header = TRUE,sep = ",",dec = ".")
    nobs <- c(nobs,sum(complete.cases(readFile)))
  }
  data.frame(id,nobs)
}
