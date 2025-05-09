# Import
yieldData <- read_csv2(
  "Test results/TEST1 2025-04-25 - Biogen - dag 1 - machine data collection.csv",
)

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
myfile_yield <- myfile_yield[complete.cases(myfile_yield),]
if (collapseData == T) {
  myfile_yield <- myfile_yield %>%
    group_by(Counter) %>%
    filter(row_number()==1)
}