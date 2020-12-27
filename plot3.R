# Download the data set i zip-file from this link:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Unzipped the file 
# Set working directiry in RStudio

library(stringr)
library(readr)
library(lubridate)
library(dplyr)
chunkData <- read_delim("household_power_consumption.txt", delim = ";", n_max = 134000)
as.Date(chunkData$Date, "%d/%m/%Y")
plotData <- chunkData[chunkData$Date == "1/2/2007" | chunkData$Date == "2/2/2007", ]
plotData$Date <- parse_date_time(plotData$Date, "%d/%m/%Y", exact = T)
plotData <- mutate(plotData, dateTime = paste(plotData$Date,plotData$Time))
plotData$dateTime <- parse_date_time(plotData$dateTime, "Ymd HMS ")
with(plotData, plot(dateTime, Sub_metering_1, type = "l", xlab = "", 
                    ylab = "Energy sub metering"))
lines(plotData$dateTime, plotData$Sub_metering_2, type = "l", col = "red")
lines(plotData$dateTime, plotData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 2)
dev.copy(png,"plot3.png")
dev.off()
