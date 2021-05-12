source("complete.R")
corr <- function(directory, threshold = 0){
  filelist <- list.files(directory, full.names = TRUE)
  data <- complete(directory)
  obj <-vector(mode = "numeric", length = 0L)
  for (i in 1:length(filelist)){
    if (data[i,"nobs"] > threshold){
      filei <- read.csv(filelist[i])
      good <-complete.cases(filei)
      temp <-cor(filei[good, ]$sulfate, filei[good, ]$nitrate)
      obj <-c(obj, temp)
    }
  }
  obj
}