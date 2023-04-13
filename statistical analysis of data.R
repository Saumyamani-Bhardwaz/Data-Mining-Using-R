library("RWeka")
N=read.arff("super_friends.arff")
# Print Data
print(N)
# Cat is used so that the newline characters are treated as string and not vectors
cat("\n\n\n")
# Printing first two rows from the data set
print(head(N,2))
# To find the dimensions of data set
dim(N)
# To find the names of variables (Column names) in data set
names(N)
# Show all the friends
N["friends"]
# Show Average school hours
N["avg_school_hours"]
# Show max of average school hours
max(N["avg_school_hours"])
# Show min of average school hours
min(N["avg_school_hours"])
# Sum of average school hours
sum(N["avg_school_hours"])
# Mean of average school hours
#mean(N["avg_school_hours"])
# Create a vector. 
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
# Find Mean.
r<- mean(x)
print(r)
# Median of average school hours
#median(sort(N["avg_school_hours"]))
median(sort(x))
# Standard Deviation of average school hours
#sd(avg_school_hours)
# To generate a summary of data
summary(N)
level<-c('Topper','Medium','Average','Below Average')
print(class(level))
print(is.factor(level))
levelfact<-factor(level)
print(is.factor(levelfact))
print(levels(levelfact))
print(class(levelfact))
