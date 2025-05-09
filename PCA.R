# Load libraries
library(readr)
library(ggplot2)
library(dplyr)
library(tibble)
library(ggfortify)

# Variables
fileName = "40287_d0_2.csv"       # Select file to import, only used 
                                  # if importAll <- F
importAll <- F                    # If set to F, specify *.csv to be 
                                  # imported in Import.R
parameterSelection <- c(          # Comment out any parameters to be excluded.
#  "#", 
#  "Date", 
#  Time, 
#  "Inj. 1", 
  "Inj. 2", 
#  "Inj. 3", 
#  "Inj. 4", 
#  "Inj. 5", 
#  "Inj. 6", 
#  "Mach. Press.", 
  "Tank. Press.", 
  "IFM. Press.", 
#  "Temp. MS", 
#  "Temp. FS", 
#  Closed, 
  "Temp. Mix", 
#  "Cond. Mix", 
  "Counter", 
#  `Tank LVL`
  "Last" # Don't remove
)

# Import
source("Import.R")
source("Import_yield.R")

# PCA Calculations
source("Calc.R")

# Plot
plot