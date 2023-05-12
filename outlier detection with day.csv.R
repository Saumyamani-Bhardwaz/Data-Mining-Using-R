#Removed all the existing objects
rm(list = ls())

#Setting the working directory
setwd("D:/Documents")
getwd()

#Load the dataset
bike_data = read.csv("day.csv",header=TRUE)

# Missing Value Analysis
sum(is.na(bike_data))
summary(is.na(bike_data))

#From the above result, it is clear that the dataset contains NO Missing Values.
#Outlier Analysis -- DETECTION

# 1. Outliers in the data values exists only in continuous/numeric form of data variables. Thus, we need to store all the numeric and categorical independent variables into a separate array structure.
col = c('temp','cnt','hum','windspeed')
categorical_col = c("season","yr","mnth","holiday","weekday","workingday","weathersit")

# 2. Using BoxPlot to detect the presence of outliers in the numeric/continuous data columns.
boxplot(bike_data[,c('temp','atemp','hum','windspeed')])

#Now, we will replace the outlier data values with NULL.

for (x in c('hum','windspeed'))
{
  value = bike_data[,x][bike_data[,x] %in% boxplot.stats(bike_data[,x])$out]
  bike_data[,x][bike_data[,x] %in% value] = NA
} 

#Checking whether the outliers in the above defined columns are replaced by NULL or not
sum(is.na(bike_data$hum))
sum(is.na(bike_data$windspeed))
as.data.frame(colSums(is.na(bike_data)))

#Removing the null values
library(tidyr)
bike_data = drop_na(bike_data)
as.data.frame(colSums(is.na(bike_data)))

#draw boxplot to verify whether ouliers removed or not
boxplot(bike_data[,c('temp','atemp','hum','windspeed')])

