# Load required packages
install.packages("cluster")
install.packages("factoextra")
library(cluster)  # clustering algorithms
library(factoextra) # visualization

# Load and preprocess the dataset
df <- Seatbelts[, 1:4]
df <- na.omit(df)
df <- scale(df)
pairs(df)

# Dissimilarity matrix
d <- dist(df, method = "euclidean")
#print(distance)
#print(distance, digits=3)
#print(distance, digits=2)

# Hierarchical clustering using Complete Linkage
hc1 <- hclust(d, method = "complete" )
plot(hc1)

# Plot the obtained dendrogram
plot(hc1, cex = 0.6, hang = -1)
 
# Cut tree into 3 groups
sub_grps <- cutree(hc1, k = 3)
plot(sub_grps)
 
# Visualize the result in a scatter plot
fviz_cluster(list(data = df, cluster = sub_grps))

# Plot the obtained dendrogram with
# rectangle borders for k clusters
plot(hc1, cex = 0.6, hang = -1)
rect.hclust(hc1, k = 3, border = 2:4)

# Compute divisive hierarchical clustering
hc3 <- diana(df)

# Divise coefficient
hc3$dc

# Plot obtained dendrogram
pltree(hc3, cex = 0.6, hang = -1,
main = "Dendrogram of diana")

