# Perform Statistical analysis of data

library("RWeka")

N = read.arff("super_sleepers.arff")

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

# Show all the animals
N["animal"]

# Show Average sleep hours
N["avg_sleep_hours"]

# Show max of average sleep hours
max(N["avg_sleep_hours"])

# Show min of average sleep hours
min(N["avg_sleep_hours"])

# Sum of average sleep hours
sum(N["avg_sleep_hours"])

# Mean of average sleep hours

#mean(N["avg_sleep_hours"])

# Create a vector. 
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)

# Find Mean.
r<- mean(x)
print(r)

# Median of average sleep hours
#median(sort(N["avg_sleep_hours"]))

median(sort(x))

# Standard Deviation of average sleep hours
#sd(avg_sleep_hours)



# To generate a summary of data
summary(N)


gender<-c('male','female','others','male','female','male')
print(class(gender))
print(is.factor(gender))
genderfact<-factor(gender)
print(is.factor(genderfact))
print(levels(genderfact))
print(class(genderfact))
