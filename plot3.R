##
## Read data from the UC Irvine Machine Learning Repository
## and generates the plot3
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
cat("Generating PNG image file plot3.png ...\n")
png("plot3.png")
par(bg = NA)
plot(plottedData$DateTime, 
     plottedData$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(plottedData$DateTime, 
      plottedData$Sub_metering_2, 
      col = "red")
lines(plottedData$DateTime, 
      plottedData$Sub_metering_3, 
      col = "blue")
legend.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       col = c("black", "red", "blue"))
dev.off()

## Clean up environment
rm(myLoadAndCleanData, plottedData)

## Done
cat("Done.\n")
