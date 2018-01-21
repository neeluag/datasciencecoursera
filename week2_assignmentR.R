pollutantmean <- function(directory, pollutant, id = 1:332) {
  #set the path
  path = directory
  
  #get the file List in that directory
  fileList = list.files(path)
  
  #extract the file names and store as numeric for comparison
  file.names = as.numeric(sub("\\.csv$","",fileList))
  
  #select files to be imported based on the user input or default
  selected.files = fileList[match(id,file.names)]
  
  #import data
  Data = lapply(file.path(path,selected.files),read.csv)
  
  #convert into data frame
  Data = do.call(rbind.data.frame,Data)
  
  #calculate mean
  mean(Data[,pollutant],na.rm=TRUE)
  
}

complete <- function(directory, id = 1:332) {
  count_complete <- function(fname) sum(complete.cases(read.csv(fname)))
  fnames <- list.files(directory, full.names=TRUE)[id]
  data.frame(id = id, complete = unlist(lapply(fnames, count_complete)))
}
