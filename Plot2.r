#EDA Week 1 Project Plot 2
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "ElectricPowerConsumption.zip")
EPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=F)
library(dplyr)
library(tidyverse)
library(lubridate)
#subsetting the data
EPCDate <- subset(EPC, Date == "1/2/2007" | Date == "2/2/2007")
EPCDate$datetime <- strptime(paste(EPCDate$Date, EPCDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plot 2
#weekdays(as.Date(EPCDate$Date, format = "%Y/%m/%d"))
EPCDate$dayofweek <- wday(EPCDate$datetime)

plot(as_datetime(EPCDate$datetime), EPCDate$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#View(EPCDate)
#Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
