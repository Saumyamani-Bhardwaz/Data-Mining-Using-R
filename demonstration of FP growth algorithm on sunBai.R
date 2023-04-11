#fpgrowth algorithm program

setwd("D:\\Downloads\\Worksheets Sem 6th\\DM_LAB")
install.packages("RWeka")
install.packages("arulesViz")
install.packages("arules")
library("arules")
library("arulesViz")

data("Mushroom")
print(Mushroom)
summary(Mushroom)

fprules <- fim4r(SunBai, method = "fpgrowth", target = "rules", supp = 50, conf = 40)

fprules
print(fprules)

inspect(fprules[1:5])


# this will convert the values which are inside in fprules in the type of data frame
x <- as(fprules, "data.frame")
print(x)

# this will write the data in csv format
write.csv(x, file="mashroomrules.csv")
