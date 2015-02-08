##
## Common functions to load and clean data before plotting
## This file is sourced by plot1.R, plot2.R, etc.
##

## Load houshold data and do required conversion and cleaning
myLoadAndCleanData <- function() {
  ## Check of source dataset file
  cat("Checking for required source data...\n")
  if (!file.exists("household_power_consumption.txt"))
    stop("'Houshold Power Consumption' dataset file not found, aborting...")
  
  ## Load dataset in memory
  ## Only the required lines are loaded into memory.
  ## Row numbers for arguments 'skip' and 'nrows' can be derived
  ## either using simple Unix-Linux commands like grep and less
  ## (as I did) or by visual inspecion loading the source data file 
  ## in a text editor
  cat("Loading source dataset...\n")
  plottedData <- read.table("household_power_consumption.txt", 
                              sep = ";",
                              header = FALSE,
                              colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                              col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                              na.strings = "?",
                              skip = 66637,
                              nrows = 2880)
  
  ## Clean up NAs
  cat("Cleaning NAs...\n")
  plottedData <- plottedData[!is.na(plottedData$Voltage),]
  
  ## Converting dates and times
  cat("Converting dates and times...\n")
  plottedData$DateTime <- strptime(paste(plottedData$Date, plottedData$Time), 
                                   "%d/%m/%Y %H:%M:%S")
  
  return(plottedData)
}
