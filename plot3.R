#!/usr/bin/env Rscript
#
# Creates a plot of all the Sub metering column values over the timespan
# 01-02-2007 to 02-02-2007 and stores it into the `plot3.png` file.
#
# 1. Make sure the data exists by source the prerequisites.R file
# 2. Import the readdata function and read the
# 	 `data/household_power_consumption_processed.txt`
#    file into the `data` variable
#
# 3. Create the png for the plot as follows:
# 3.1 Open the png device
# 3.2 Call the plot with the a vector of the Time column as the x component
#     for every Sub_metering column in the vector
#     c(Sub_metering_1, Sub_metering_2, Sub_metering_3) as the y component.
#     and use the the type = 'n' , for no plotting.
# 3.3 Plot the Time vs. Sub_metering_1 as lines with the line color black.
# 3.4 Plot the Time vs. Sub_metering_2 as lines with the line color red.
# 3.5 Plot the Time vs. Sub_metering_3 as lines with the line color blue.
# 3.6 Create a legend box in the top right of the plot that contains the column
#     names using the same color as that was used to draw the lines for the
#     text color in the legend box.
# 3.7 Call the `dev.off()` function to store the histogram into the png device.
source('./prerequisites.R')
source('./readdata.R')
data <- readdata('./data/household_power_consumption_processed.txt')

png("plot3.png", height = 504, width = 504, bg = "transparent")
with(data,
	plot(c(Time, Time, Time), c(Sub_metering_1, Sub_metering_2, Sub_metering_3),
		type = "n", ylab = "Energy sub metering", xlab = ""))
with(data, points(Time, Sub_metering_1, col = "black", type = "l"))
with(data, points(Time, Sub_metering_2, col = "red",   type = "l"))
with(data, points(Time, Sub_metering_3, col = "blue",  type = "l"))
legend("topright",
	lwd = 1.5,
	col = c("black", "blue", "red"),
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
