library(RWeka)
getwd()
rating <- 1:4
name <- c('apporva', 'prabh', 'akash', 'naman')
study_time <- c(2,4,2,3)
subject <- c('React', 'flutter', 'Kotlin', 'Fullstack')
toppers <- data.frame(rating,name,study_time,subject, stringsAsFactors = FALSE)
print(toppers)
print(class(toppers))
write.arff(toppers,file="toppers.arff")
getwd
