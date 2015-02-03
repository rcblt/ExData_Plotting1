##
## Read data from the UC Irvine Machine Learning Repository
## and generates the plot1
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
cat("Generating PNG image file plot1.png ...\n")
png("plot1.png")
hist(plottedData$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red")
dev.off()

## Clean up environment
rm(myLoadAndCleanData, plottedData)

## Done
cat("Done.\n")

