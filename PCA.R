# Load libraries
library(readr)
library(ggplot2)
library(dplyr)
library(tibble)
library(ggfortify)
library(ggrepel)
library(psych)

# Variables
collapseData <- T                 # Set to T for 1 datapoint per cycle
fileName = "dag0_1_5_1.csv"       # Select file to import, only used 
                                  # if importAll <- F
                                  # yield data should be fileName prepended
                                  # With "Y_"
importAll <- F                    # If set to F, specify *.csv to be 
                                  # imported in Import.R
parameterSelection <- c(          # Comment out any parameters to be excluded.
#  "#", 
#  "Date", 
#  Time, 
 "Inj. 1", 
 "Inj. 2", 
 "Inj. 3", 
 "Inj. 4", 
#  "Inj. 5", 
#  "Inj. 6", 
#  "Mach. Press.", 
#  "Tank. Press.", 
  "IFM. Press.", 
#  "Temp. MS", 
#  "Temp. FS", 
#  Closed, 
  "Temp. Mix", 
#  "Cond. Mix", 
  "Counter", 
#  "Tank LVL",
  "Last" # Don't remove
)

# Import
source("Import.R")
source("Import_yield.R")

# PCA Calculations
source("Calc.R")

# Export plots
pdf(file=paste0(titleName, ".pdf", sep=""))
par(mfrow = c(2,2))
# Correlation data analysis
pairs.panels(
  myfile_yield[,-1],
  gap = 0,             
  bg = c("red", "yellow", "blue"),             
  pch=21,
  main="Correlation anaysis"
)
# Orthogonality analysis
#pairs.panels(
#  results$x,             
#  gap = 0,             
#  bg = c("red", "yellow", "blue"),             
#  pch=21,
#  main="Orthogonality analysis"
#)
plot
dev.off()

# Export results data
capture.output(results, file = paste0(
  titleName, 
  "_results_", 
  ".csv", 
  sep ="")
  )
capture.output(summary(results), file = paste0(
  titleName, 
  "_summary_", 
  ".csv", 
  sep ="")
)