#calculate principal components
results <- prcomp(myfiles[[1]], scale = TRUE)

#reverse the signs
results$rotation <- -1*results$rotation

#display principal components
results$rotation

#reverse the signs of the scores
results$x <- -1*results$x

#display the first six scores
head(results$x)

# ggplot ggfortify
autoplot(results, data = myfiles[[1]], 
         loadings = TRUE, loadings.label = TRUE, loadings.label.size = 3)

# Enhanced autoplot
autoplot(results, data = myfiles[[1]], colour = 1,
         loadings = TRUE, loadings.label = TRUE, loadings.label.size = 4, label = T)