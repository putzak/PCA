# Import
yieldFileName <- paste0("Y_", fileName, sep = "")
yieldData <- read_csv2(file = yieldFileName)

# Filter for chosen injector(s)
yieldData <- yieldData %>%
  select(Counter, 
         if(any(parameterSelection == "Inj. 1")) {
           ends_with("1")
           },
         if(any(parameterSelection == "Inj. 2")) {
           ends_with("2") 
           },
         if(any(parameterSelection == "Inj. 3")) {
           ends_with("3") 
         },
         if(any(parameterSelection == "Inj. 4")) {
           ends_with("4") 
         },
         )
myfile_yield <- merge(myfile, yieldData)

# Add new series number 20 cycles after counter change for NOT
myfile_yield$Series <- 0
wait <- 20
for (i in 2:(length(myfile_yield[,1])-1)) {
  if (myfile_yield$Counter[i] > myfile_yield$Counter[i-1]) {
    wait <- 20
  }
  wait <- wait-1
  if (wait == 1) {
    myfile_yield$Series[i] <- myfile_yield$Series[i]+1
  }
  myfile_yield$Series[i+1] <- myfile_yield$Series[i]
}
NOTdata <- myfile_yield %>%
  select(starts_with("Inj"), Series)

# Clean up and merge
colnames(NOTdata) <- c(parameterSelection[c(1:length(NOTdata)-1)], 
                       "Counter")
myfile_yield <- myfile_yield %>%
  select(-parameterSelection[c(1:length(NOTdata)-1)], 
         -Series)
NOTdata <- NOTdata[-c(1:19),]

# Collapse myfile_yield
if (collapseData == T) {
  myfile_yield <- myfile_yield %>%
    group_by(Counter) %>%
    filter(row_number()==1)
}

myfile_yield <- merge(myfile_yield, NOTdata)

# Collapse with NOTdata incorporated
myfile_yield <- myfile_yield %>%
  group_by(Counter) %>%
  filter(row_number()==1)

# Remove NA's
myfile_yield <- myfile_yield[complete.cases(myfile_yield),]