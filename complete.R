complete <- function(directory,id=1:332){
  
  files<-list.files(directory,full.names = TRUE)
  dataf <- data.frame()
  ids=id
  
  for(id in ids){
    temp<- read.csv(files[id],header=TRUE)
    #delete rows that do not have complete cases
    temp<-na.omit(temp)
    nobs<-nrow(temp)
    dataf<-rbind(dataf,data.frame(id,nobs))
    
  }
  dataf
}
