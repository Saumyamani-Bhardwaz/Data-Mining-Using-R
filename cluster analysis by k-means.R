# Installing required packages
# ClusterR is an R package for cluster analysis and provides functions for k-means clustering,
hierarchical clustering, and more.
install.packages("ClusterR")
#The cluster package is an R package for cluster analysis, including functions for k-means
clustering, hierarchical clustering, and other algorithms.
install.packages("cluster")
# Loading packages
library(ClusterR) # Load ClusterR library
library(cluster) # Load cluster library
# Loading Seatbelts dataset
data(Seatbelts)
# Removing rows with missing values
Seatbelts_1 <- na.omit(Seatbelts[, -1]) # Remove rows with missing values in Seatbelts
dataset
# Fitting K-Means clustering Model to training dataset
set.seed(240) # Setting seed for reproducibility
kmeans.re <- kmeans(Seatbelts, centers = 3, nstart = 20) # Fit k-means clustering model to
Seatbelts dataset with 3 clusters and 20 starts
# Cluster identification for each observation
kmeans.re$cluster # Display the cluster identification for each observation
# Creating a confusion matrix
cm <- table(Seatbelts$front, kmeans.re$cluster) # Create a confusion matrix of Seatbelts
dataset and k-means clustering result
cm # Display the confusion matrix# Model Evaluation and visualization
# Plot drivers vs front for Seatbelts dataset
plot(Seatbelts[, c("drivers", "front")], ylim = c(0, max(Seatbelts_1$front)))
# Plot drivers vs front for Seatbelts dataset with cluster colors
plot(Seatbelts[, c("drivers", "front")], col = kmeans.re$cluster, ylim = c(0,
max(Seatbelts$front)))
# Plot drivers vs front for Seatbelts dataset with cluster colors and main title
plot(Seatbelts[, c("drivers", "front")], col = kmeans.re$cluster, main = "K-means with 3
clusters", ylim = c(0, max(Seatbelts_1$front)))
# Plotting cluster centers
# Display the cluster centers
kmeans.re$centers
# Display the cluster centers for drivers and front features
kmeans.re$centers[, c("drivers", "front")]
# Plot the cluster centers with different colors, shapes and size
points(kmeans.re$centers[, c("drivers", "front")], col = 1:3, pch = 8, cex = 3)
# Visualizing clusters
y_kmeans <- kmeans.re$cluster # Assign the cluster identification to y_kmeans variable
clusplot(Seatbelts[, c("drivers", "front")], # Plot a cluster plot of drivers vs front for
Seatbelts dataset
y_kmeans,
lines = 0,
shade = TRUE,
color = TRUE,
labels = 2,
plotchar = FALSE,
span = TRUE,
main = "Cluster Seatbelt",
xlab = 'drivers',ylab = 'front')
