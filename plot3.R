# Exploratory Data Analysis - Course Project 1

# create data.table if it doesn't already exists
if(!exists("hpc")) {
        source("read_data.R")
}

# hack so this script can be sourced by plot4.R
if(!exists("do_not_open_or_close_png_device_for_plot3")){
        png(filename = "plot3.png", width = 480, height = 480)
        par(mfrow = c(1,1)) # 1-panel plot
}

# make plot on open png device
with(hpc, plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(hpc, lines(datetime, Sub_metering_2, col = "red"))
with(hpc, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# hack so this script can be sourced by plot4.R
if(!exists("do_not_open_or_close_png_device_for_plot3")){
        dev.off()
}