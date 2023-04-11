#Apriori Algorithm
install.packages("arules")
install.packages("arulesViz")
install.packages("RColorBrewer")
library(arules)
library(arulesViz)

library(RColorBrewer)

#import dataset

data("Groceries")
print(Groceries)
summary(Groceries)

#generating rule1
#using apriori() function
rule1 <- apriori(Groceries,parameter = list(supp=0.01, conf=0.2))

#using inspect() function
inspect(rule1[1:9])
inspect(head(rule1,8))
inspect(head(sort(rule1,by="lift"),5))

plot(rule1)
plot(rule1,method = "grouped")

#generating rule2
rule2 <- apriori(Groceries,parameter = list(supp= 0.007, conf=0.6))
inspect(head(rule2,5))
plot(rule2,method="grouped")

#observation for rule2 is whole milk is rhs in all the cases

#generating the rules3
rule3 <- apriori(Groceries,parameter = list(supp=0.002, conf=0.5 , minlen=5 ))
inspect(head(rule3,5))

rule4 <- apriori(Groceries,parameter = list(supp=0.004, conf=0.7))
inspect(head(rule4,6))

rule5 <- apriori(Groceries,parameter = list(supp=0.006, conf=0.8  ))
inspect(head(rule5,7))

arules::itemFrequencyPlot(Groceries,topN=20,
                          main='Relative Item Frequency Plot',
                          type='relative',
                          ylab= "Item Frequency (Relative)")
