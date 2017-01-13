corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating the location of
  ## the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the number of
  ## completely observed observations (on all variables) required to compute
  ## the correlation between nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  ##list all files present in dir
  allfiles <- list.files(path = directory, pattern = ".csv" , full.names = TRUE)
  correlations <- numeric()
  newdata <- complete(directory)
  filteredData <- subset(newdata,nobs>threshold)
  monitorID<- filteredData$id
  
  for(i in monitorID){
    
    readFile <- read.csv(allfiles[i],header = TRUE,sep = ",",dec = ".")
    dff <- readFile[complete.cases(readFile), ]
    correlations = c(correlations, cor(dff$sulfate, dff$nitrate))
    
  }
  
  correlations
  
}

