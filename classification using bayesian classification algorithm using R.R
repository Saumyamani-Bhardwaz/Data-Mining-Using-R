# Using Naive Bayes algorithm 
#Functions for latent class analysis, support vector machines, 
#shortest path computation, bagged clustering, naive Bayes classifier
 install.packages("e1071") 
#Contains several basic utility functions including: moving (rolling, running) window statistic functions, read/write 
install.packages("caTools") 
#Misc functions for training and plotting classification and regression models. 
install.packages("caret") 
# Installing library for the given experiment
library(e1071) 
library(caTools)
 library(caret) 
library(rpart) 
library(rpart.plot)
orange_data = Orange
str(orange_data)
summary(orange_data)
# Splitting data into train and test data
spl = sample.split(orange_data, SplitRatio = 0.7)
dataTrain = subset(orange_data, spl==TRUE)
dataTest = subset(orange_data, spl==FALSE)
dataTrain
dataTest

# Feature Scaling
train_scale <- scale(dataTrain[, 2:3])
test_scale <- scale(dataTest[, 2:3])
# Fitting Naive Bayes Model to training dataset
#The use of set.seed is to make sure that we get the same results for randomization. 
set.seed(120)     
#If we randomly select some observations for any task in R or in 
#any statistical software it results 
#in different values all the time and this happens because of randomization  
classifier_cl <- naiveBayes(age ~ ., data = dataTrain)
classifier_cl

# Predicting on test data'
y_pred <- predict(classifier_cl, newdata = dataTest)

# summarize accuracy
table_matrix <- table(dataTest$age, y_pred)
print(table_matrix)

#table(predictions, orange$age)
accuracy_Test <- sum(diag(table_matrix)) / sum(table_matrix)
cat("Test Accuracy is: ", accuracy_Test)

# Confusion Matrix
cm <- table(dataTest$age, y_pred)
cm
# Model Evaluation
confusionMatrix(cm)

