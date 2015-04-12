#!/usr/bin/env Rscript
#
# Creates the following four plots:
#
#		* "Global active power" over the timespan `01-02-2007` to `02-02-2007`
#		* "Voltage" over the timespan `01-02-2007` to `02-02-2007`
#		* "Energy sub metering" over the timespan `01-02-2007` to `02-02-2007`
#		* "Global Reactive power" over the timespan `01-02-2007` to `02-02-2007`
#
# and stores  them into the `plot4.png` file with the plots as 2x2 grid.
#
# 1. Make sure the data exists by source the prerequisites.R file
# 2. Import the readdata function and read the
# 	 `data/household_power_consumption_processed.txt`
#    file into the `data` variable
#
# 3. Create the png for the plot as follows:
# 3.1 Open the png device
# 3.2 Call the par command with mfcol = c(2,2) and mfrow = c(2,2) to write
#     the four plots as a 2x2 grid.
# 3.3 Plot the "Global active power" column over "Time" in the top left column.
# 3.4 Plot the "Voltage" column over "Time" in the top right column.
# 3.5 Plot all the "Sub metering" columns over "Time" in the bottom left column.
#     This is the same process as in the plot3.R file.
# 3.6 Plot "Global reactive power" column over "Time" in the bottom rights column.
# 3.7 Call the `dev.off()` function to store the histogram into the png device.
source('./prerequisites.R')
source('./readdata.R')
data <- readdata('./data/household_power_consumption_processed.txt')

png("plot4.png", height = 504, width = 504, bg = "transparent")
par(mfcol = c(2, 2), mfrow = c(2, 2))

# top left
with(data, plot(Time, Global_active_power, type = "l",
	ylab = "Global Active Power", xlab = ""))

# top right
with(data, plot(Time, Voltage, type = "l",
	ylab = "Voltage", xlab = "datetime"))

# bottom left
with(data,
	plot(c(Time, Time, Time), c(Sub_metering_1, Sub_metering_2, Sub_metering_3),
		type = "n", ylab = "Energy sub metering", xlab = ""))
with(data, points(Time, Sub_metering_1, col = "black", type = "l"))
with(data, points(Time, Sub_metering_2, col = "red",   type = "l"))
with(data, points(Time, Sub_metering_3, col = "blue",  type = "l"))
legend("topright",
	bty = "n",
	lwd = 1.5,
	col = c("black", "blue", "red"),
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# bottom right
with(data, plot(Time, Global_reactive_power, type = "l",
	ylab = "Global Reactive Power", xlab = "datetime"))

dev.off()
