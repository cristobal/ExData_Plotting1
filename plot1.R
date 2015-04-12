#!/usr/bin/env Rscript
#
# Creates a histogram of the Global Active Power column and stores it into
# the `plot1.png` file
#
# 1. Make sure the data exists by source the prerequisites.R file
# 2. Import the readdata function and read the
# 	 `data/household_power_consumption_processed.txt`
#    file into the `data` variable
#
# 3. Create the png of the histogram as follows:
# 3.1 Open the png device
# 3.2 Create the histogram of the `Global Active Power` column with red as the
#     fill color for the frequency columns
# 3.3 Call the `dev.off()` function to store the histogram into the png device.
source('./prerequisites.R')
source('./readdata.R')
data <- readdata('./data/household_power_consumption_processed.txt')

png("plot1.png", height = 504, width = 504, bg = "transparent")
hist(data$Global_active_power, main = "Global Active power",
	xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
