library(RWeka)
library(partykit)
library(caTools)

data("iris")

str(iris)

summary(iris)

spl = sample.split(iris, SplitRatio = 0.7)

dataTrain = subset(iris, spl==TRUE)
dataTest = subset(iris, spl==FALSE)

m1 <- J48(Species~., dataTrain) 
summary(m1)

dataTestPred <- predict(m1, newdata = dataTest)
table_matrix <- table(dataTest$Species, dataTestPred)

print(table_matrix)

accuracy_Test <- sum(diag(table_matrix)) / sum(table_matrix)

cat("Test Accuracy is: ", accuracy_Test)

# Initate PDF File
pdf("dt_iris_plot.pdf", paper="a4")

plot(m1, type="simple")

#Close PDF file
dev.off()