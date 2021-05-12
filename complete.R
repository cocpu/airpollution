complete <- function(directory, id = 1:332){
  filelist <- list.files(directory, full.names = TRUE)
  data <-data.frame()
  for (i in id){
    filei <- read.csv(filelist[i])
    good <-complete.cases(filei)
    nobs <-sum(good)
    tmp <- data.frame(i,nobs)
    data <- rbind(data, tmp)
  }
  colnames(data)<-c("id","nobs")
  data
}