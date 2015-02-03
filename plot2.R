##
## Read data from the UC Irvine Machine Learning Repository
## and generates the plot2
##

## Check of source dataset file
cat("Loading required common code...\n")
if (!file.exists("common.R"))
  stop("File common.R not found, aborting...")

## Load common code
source("common.R")

## Load dataset for plots
plottedData <- myLoadAndCleanData()

## Generate plot
cat("Generating PNG image file plot2.png ...\n")
png("plot2.png")
plot(plottedData$DateTime, 
     plottedData$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)")
dev.off()

## Clean up environment
rm(myLoadAndCleanData, plottedData)

## Done
cat("Done.\n")

