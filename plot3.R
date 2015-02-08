##
## Read data from the UC Irvine Machine Learning Repository
## and generates the plot3
##

## Load common code to check and load the dataset
## See script common.R for more descriptions
source("common.R")

## Load dataset for plots
plottedData <- myLoadAndCleanData()

## Generate plot
cat("Generating PNG image file plot3.png ...\n")
png("plot3.png")

## Transparent background as the images in the forked repo
par(bg = NA)
plot(plottedData$DateTime, 
     plottedData$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
## Add second line
lines(plottedData$DateTime, 
      plottedData$Sub_metering_2, 
      col = "red")
## Add third line
lines(plottedData$DateTime, 
      plottedData$Sub_metering_3, 
      col = "blue")
## Add legend
legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       col = c("black", "red", "blue"))
dev.off()

## Clean up environment
rm(myLoadAndCleanData, plottedData)

## Done
cat("Done.\n")
