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
  cat("Loading source dataset...\n")
  householdData <- read.table("household_power_consumption.txt", 
                              sep = ";",
                              header = TRUE,
                              colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                              na.strings = "?")
  
  ## Get only the requested records
  cat("Keeping only required rows...\n")
  plottedData <- householdData[householdData$Date == "1/2/2007" | 
                                 householdData$Date == "2/2/2007",]
  rm(householdData)
  
  ## Clean up NAs
  cat("Cleaning NAs...\n")
  plottedData <- plottedData[!is.na(plottedData$Voltage),]
  
  ## Converting dates and times
  cat("Converting dates and times...\n")
  plottedData$DateTime <- strptime(paste(plottedData$Date, plottedData$Time), 
                                   "%d/%m/%Y %H:%M:%S")
  
  return(plottedData)
}
