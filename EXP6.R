# Structure
str(Orange)
#Performing Naive Bayes on Dataset
#Using Naive Bayes algorithm on the dataset which includes 11 persons and 6 variables or attributes
# Installing Packages
install.packages("e1071")
install.packages("caTools")
install.packages("caret")
install.packages("RWeka")

# Loading package
library(e1071)
library(caTools)
library(caret)

library(RWeka)
library(rpart)
library(rpart.plot)
library(partykit)

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
set.seed(120)        # Setting Seed
classifier_cl <- naiveBayes(age ~ ., data = dataTrain)
classifier_cl

# Predicting on test data'
y_pred <- predict(classifier_cl, newdata = dataTest)

# summarize accuracy
table_matrix <- table(dataTest$age, y_pred)
print(table_matrix)
#table(predictions, iris$Species)
accuracy_Test <- sum(diag(table_matrix)) / sum(table_matrix)
cat("Test Accuracy is: ", accuracy_Test)

# Confusion Matrix
cm <- table(dataTest$age, y_pred)
cm
# Model Evaluation
confusionMatrix(cm)
