# Import dataset(s)
temp = list.files(pattern="\\.csv$")
myfiles = lapply(temp, read_csv)
custom_colnames <- c(
  "#", 
  "Date", 
  "Time", 
  "Inj. 1", 
  "Inj. 2", 
  "Inj. 3", 
  "Inj. 4", 
  "Inj. 5", 
  "Inj. 6", 
  "Mach. Press.", 
  "Tank. Press.", 
  "IFM. Press.", 
  "Temp. MS", 
  "Temp. FS", 
  "Closed", 
  "Temp. Mix", 
  "Cond. Mix", 
  "Counter", 
  "Tank LVL"
)
myfiles <- lapply(myfiles, setNames, nm = custom_colnames)
for (i in 1:length(myfiles)) {
  myfiles[[i]] <- myfiles[[i]] %>%
    select(-`#`:-Time, -`Inj. 5`: -`Inj. 6`)
}