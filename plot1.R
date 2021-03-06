##
## Read data from the UC Irvine Machine Learning Repository
## and generates the plot1
##

## Load common code to check and load the dataset
## See script common.R for more descriptions
source("common.R")

## Load dataset for plots
plottedData <- myLoadAndCleanData()

## Generate plot
cat("Generating PNG image file plot1.png ...\n")
png("plot1.png")

## Transparent background as the images in the forked repo
par(bg = NA)
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

