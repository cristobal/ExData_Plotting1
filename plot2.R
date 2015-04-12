#!/usr/bin/env Rscript
#
# Creates a plot of the Global Active Power over the timespan 01-02-2007 to
# 02-02-2007 and stores it into the `plot2.png` file.
#
# 1. Make sure the data exists by source the prerequisites.R file
# 2. Import the readdata function and read the
# 	 `data/household_power_consumption_processed.txt`
#    file into the `data` variable
#
# 3. Create the png for the plot as follows:
# 3.1 Open the png device
# 3.2 Make the plot of Time as the x component and the `Global Active Power`
#     as the y component with the type = 'l' for lines.
# 3.3 Call the `dev.off()` function to store the histogram into the png device.
source('./prerequisites.R')
source('./readdata.R')
data <- readdata('./data/household_power_consumption_processed.txt')

png("plot2.png", height = 504, width = 504, bg = "transparent")
with(data, plot(Time, Global_active_power, type = "l",
	ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
