corr<-function(directory,threshold=0){
  files<-list.files(directory,full.names = TRUE)
  
  #create empty vector
  dat <- vector(mode = "numeric", length = 0)
  
  for(i in 1:length(files)){
    #read in file
    temp<- read.csv(files[i],header=TRUE)
    temp<-temp[complete.cases(temp),]
    csum<-nrow(temp)
    if(csum>threshold){
      dat<-c(dat,cor(temp$nitrate,temp$sulfate))
    }
    
  }
  
  return(dat)
}