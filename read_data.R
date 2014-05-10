# Exploratory hpca Analysis - Course Project 1

# download and unzip data file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "household_power_consumption.zip", mode = "wb")
unzip("household_power_consumption.zip")

# read data into data.table and retain data only for two days
library(data.table)
hpc <- fread("household_power_consumption.txt", na.strings = '?')
hpc <- hpc[Date %in% c("1/2/2007", "2/2/2007")]

# create new variable datetime from Date and Time
hpc <- hpc[, datetime := paste(Date, Time)]
hpc$Date <- NULL
hpc$Time <- NULL

# change each variabe to its correct class
hpc$datetime <- as.POSIXct(strptime(hpc[, datetime], "%d/%m/%Y %H:%M:%S"))
hpc <- hpc[, Global_active_power := as.numeric(Global_active_power)]
hpc <- hpc[, Global_reactive_power := as.numeric(Global_reactive_power)]
hpc <- hpc[, Voltage := as.numeric(Voltage)]
hpc <- hpc[, Global_intensity := as.numeric(Global_intensity)]
hpc <- hpc[, Sub_metering_1 := as.numeric(Sub_metering_1)]
hpc <- hpc[, Sub_metering_2 := as.numeric(Sub_metering_2)]