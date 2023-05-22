install.packages("rpart")
install.packages("rpart.plot")
# load the package
library(RWeka)
library(rpart)
library(rpart.plot)
library(partykit)
library(caTools)
# load data
#data(iris)
iris_data = iris
str(iris_data)
summary(iris_data)
#data("cars")
#print(cars)
#data(mtcars)
#print(mtcars)
# Part 1: fit model(recursive partitioning decision tree method)
#fit<-rpart(hp~.,data=mtcars)
spl = sample.split(iris_data, SplitRatio = 0.7)
dataTrain = subset(iris_data, spl==TRUE)
dataTest = subset(iris_data, spl==FALSE)
fit1 <- rpart(Species~., dataTrain)
# summarize the fit
summary(fit1)
rpart.plot(fit1)
# make predictions
#predictions <- predict(fit, mtcars[,1:4], type="class")
predictions1 <- predict(fit1, newdata = dataTest, type="class")

# summarize accuracy
table_matrix <- table(dataTest$Species, predictions1)
print(table_matrix)
#table(predictions, iris$Species)
accuracy_Test <- sum(diag(table_matrix)) / sum(table_matrix)
cat("Test Accuracy is: ", accuracy_Test)


# Part 2: fit model using j48 package of R
#The C4.5 algorithm is an extension of the ID3(Iterative Dichotomiser 3) algorithm that constructs a decision tree to maximize information gain (difference in entropy).

fit2 <- J48(Species~., dataTrain)
# summarize the fit
summary(fit2)
# make predictions
predictionsj48 <- predict(fit2, newdata = dataTest, type="class")
# summarize accuracy
table_matrixj48 <- table(dataTest$Species, predictionsj48)
print(table_matrixj48)
#table(predictions, iris$Species)
accuracy_Testj48 <- sum(diag(table_matrixj48)) / sum(table_matrixj48)
cat("Test Accuracy is: ", accuracy_Testj48)


# Part3: fit model using PART of weka
#PART is a rule system that creates pruned C4.5 decision trees for the data set and extracts rules and those instances that are covered by the rules are removed from the training data. The process is repeated until all instances are covered by extracted rules.
fit3 <- PART(Species~., dataTrain)
# summarize the fit
summary(fit3)
# make predictions
predictionsPART <- predict(fit3, newdata = dataTest, type="class")
# summarize accuracy
table_matrixPART <- table(dataTest$Species, predictionsPART)
print(table_matrixPART)
#table(predictions, iris$Species)
accuracy_TestPART <- sum(diag(table_matrixPART)) / sum(table_matrixPART)
cat("Test Accuracy is: ", accuracy_TestPART)
