#EDA Week 1 Project Plot 4
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "ElectricPowerConsumption.zip")
EPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=F)
library(dplyr)
library(tidyverse)
library(lubridate)
#subsetting the data
EPCDate <- subset(EPC, Date == "1/2/2007" | Date == "2/2/2007")
EPCDate$datetime <- strptime(paste(EPCDate$Date, EPCDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


EPCDate$Date <- as_datetime(EPCDate$datetime)
EPCDate$Global_active_power <- as.numeric(EPCDate$Global_active_power)
EPCDate$Sub_metering_1 <- as.numeric(EPCDate$Sub_metering_1)
EPCDate$Sub_metering_2 <- as.numeric(EPCDate$Sub_metering_2)
EPCDate$Sub_metering_3 <- as.numeric(EPCDate$Sub_metering_3)
EPCDate$Global_reactive_power <- as.numeric(EPCDate$Global_reactive_power)
EPCDate$Voltage <- as.numeric(EPCDate$Voltage)

#Plot 4
par(mfrow=c(2,2))
plot(EPCDate$datetime, EPCDate$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(EPCDate$datetime, EPCDate$Voltage, type = "l", xlab="datetime", ylab="Voltage")
plot(EPCDate$datetime, EPCDate$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(EPCDate$datetime, EPCDate$Sub_metering_2,type="l", col= "red")
lines(EPCDate$datetime, EPCDate$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2.5, col = c("black", "red", "blue"), bty = "o")
plot(EPCDate$datetime, EPCDate$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
