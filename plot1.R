# Download the data set i zip-file from this link:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Unzipped the file 
# Set working directiry in RStudio

library(stringr)
library(readr)
chunkData <- read_delim("household_power_consumption.txt", delim = ";", n_max = 134000)
as.Date(chunkData$Date, "%d/%m/%Y")
plotData <- chunkData[chunkData$Date == "1/2/2007" | chunkData$Date == "2/2/2007", ]
plot1 <- hist(plotData$Global_active_power, col = "red", main = "Global Active Power",
              xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()
     