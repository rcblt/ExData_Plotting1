##
## Read data from the UC Irvine Machine Learning Repository
## and generates the plot4
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
cat("Generating PNG image file plot4.png ...\n")
png("plot4.png")
par(mfrow = c(2, 2), bg = NA)
plot(plottedData$DateTime, 
     plottedData$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power"
)
plot(plottedData$DateTime, 
     plottedData$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage"
)
with(plottedData, {
  plot(DateTime, 
       Sub_metering_1, 
       type = "l", 
       xlab = "", 
       ylab = "Energy sub metering"
  )
  lines(DateTime, 
        Sub_metering_2, 
        col = "red"
  )
  lines(DateTime, 
        Sub_metering_3, 
        col = "blue"
  ) 
  legend(x = "topright", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = 1, 
         col = c("black", "red", "blue"),
         bty = "n"
  )}
)
plot(plottedData$DateTime, 
     plottedData$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global Reactive Power"
)
dev.off()

## Clean up environment
rm(myLoadAndCleanData, plottedData)

## Done
cat("Done.\n")

