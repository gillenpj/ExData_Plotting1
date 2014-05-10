# Exploratory Data Analysis - Course Project 1

# create data.table if it doesn't already exists
if(!exists("hpc")) {
        source("read_data.R")
}

# make 1-panel plot on png device
png(filename = "plot2.png", width = 480, height = 480)
par(mfrow = c(1,1))
with(hpc, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()