#calculate principal components
if (importAll == T) {
  results <- prcomp(myfiles[[1]], scale = TRUE)
  calcData <- myfiles[[1]]
} else {
  results <- prcomp(myfile_yield[,-1], scale = TRUE)
  calcData <- myfile_yield
}
#reverse the signs
results$rotation <- -1*results$rotation

#reverse the signs of the scores
results$x <- -1*results$x

# ggplot ggfortify
titleName <- gsub(pattern = ".csv", "", fileName)
subTitle <- paste0(parameterSelection_name, collapse = " ")
subTitle <- gsub("Counter", "", subTitle)
plot <- autoplot(results, 
                 data = calcData, 
                 loadings = TRUE, 
                 loadings.label = TRUE, 
                 loadings.label.size = 3,
                 loadings.colour='red',
                 loadings.label.repel=TRUE,
                 title = titleName
                 ) + ggtitle(
                   titleName, 
                   subtitle = subTitle 
                   )

# Enhanced autoplot
#autoplot(results, data = calcData, colour = 1,
#         loadings = TRUE, loadings.label = TRUE, loadings.label.size = 4, label = T)