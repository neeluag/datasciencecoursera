pollutantmean <- function(directory, pollutant, id = 1:332) {

  fileList = list.files(directory)
  
  #extract the file names and store as numeric for comparison
  file.names = as.numeric(sub("\\.csv$","",fileList))
  
  #select files to be imported based on the user input or default
  selected.files = fileList[match(id,file.names)]
  
  #import data
  Data = lapply(file.path(directory,selected.files),read.csv)
  
  #convert into data frame
  Data = do.call(rbind.data.frame,Data)
  
  #calculate mean
  mean(Data[,pollutant],na.rm=TRUE)
  
}