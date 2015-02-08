##
## Read data from the UC Irvine Machine Learning Repository
## and generates the plot2
##

## Load common code to check and load the dataset
## See script common.R for more descriptions
source("common.R")

## Load dataset for plots
plottedData <- myLoadAndCleanData()

## Generate plot
cat("Generating PNG image file plot2.png ...\n")
png("plot2.png")

## Transparent background as the images in the forked repo
par(bg = NA)
plot(plottedData$DateTime, 
     plottedData$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

## Clean up environment
rm(myLoadAndCleanData, plottedData)

## Done
cat("Done.\n")
