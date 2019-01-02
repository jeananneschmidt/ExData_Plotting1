#EDA Week 1 Project Plot 1
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "ElectricPowerConsumption.zip")
EPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=F)
library(dplyr)
library(tidyverse)
library(lubridate)
#subsetting the data
EPCDate <- subset(EPC, Date == "1/2/2007" | Date == "2/2/2007")
EPCDate$datetime <- strptime(paste(EPCDate$Date, EPCDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Plot 1
hist(EPCDate$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

