# Import
yieldData <- read_csv2(
  "Test results/TEST1 2025-04-25 - Biogen - dag 1 - machine data collection.csv",
  )

myfile_yield <- merge(myfile, yieldData)
myfile_yield <- myfile_yield[complete.cases(myfile_yield),]