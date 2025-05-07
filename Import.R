# Import dataset(s)
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

# Adjust parameter selection variable
parameterSelection_name <- NA
for (i in 1:length(parameterSelection)) {
  parameterSelection_name <- append(
    parameterSelection,
    as.name(parameterSelection[i])
  )
}
parameterSelection_name <- parameterSelection_name[
  -length(parameterSelection_name)
]
parameterSelection_name <- parameterSelection_name[
  -length(parameterSelection_name)
]

# Importall
if (importAll == T) {
temp = list.files(pattern="\\.csv$")
myfiles = lapply(temp, read_csv)

myfiles <- lapply(myfiles, setNames, nm = custom_colnames)
for (i in 1:length(myfiles)) {
  myfiles[[i]] <- myfiles[[i]] %>%
    select(-`#`:-Time, -`Inj. 5`: -`Inj. 6`, -Closed)
}

# Import 1
} else {
  myfile <- read_csv(file = fileName) # Select file to import
  colnames(myfile) <- custom_colnames
  myfile <- myfile[, names(myfile) %in% as.character(parameterSelection_name)]
}
