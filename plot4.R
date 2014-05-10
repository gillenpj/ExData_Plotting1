# Exploratory Data Analysis - Course Project 1

# create data.table if it doesn't already exists
if(!exists("hpc")) {
        source("read_data.R")
}

# make 4-panel plot on png device
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# make panel 1
with(hpc, plot(datetime, Global_active_power, ylab = "Global Active Power", xlab = "", , type = "l"))

# make panel 2
with(hpc, plot(datetime, Voltage, type = "l"))

# make panel 3 using hack
do_not_open_or_close_png_device_for_plot3 <- TRUE
source("plot3.R")
rm(do_not_open_or_close_png_device_for_plot3)

# make panel 4
with(hpc, plot(datetime, Global_reactive_power, type = "l"))

# close device with 4-panel plot
dev.off()