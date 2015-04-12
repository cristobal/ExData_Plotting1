#!/usr/bin/env R
readdata <- function (file) {
	# Reads the data from the a household power consumption csv file
	#
	# Args:
  #   file: a file that contains the dataset for the
  # 				"Individual household electric power consumption".
  #
	# 1. read the csv file into a data frame
	# 2. loop over all the values from 1:nrow(data) and
	# 2.1 glue the date + time into the format "%d/%m/%Y %H:%M:%S" and
	#     override the existing date format
	# 3. Convert the existing Date and Time column values using the as.Date and
	#    strptime function respectively.
	#
	# 4. return the parses data frame
	data <- read.csv(file, sep = ";", na.strings = "?", stringsAsFactors = F)
	for (i in seq_along(1:nrow(data))) {
		date  <- data$Date[i]
		time  <- data$Time[i]
		data$Time[i] <- paste(c(date, time), collapse = " ")
	}
	data$Date = as.Date(data$Date, format = "%d/%m/%Y")
	data$Time = strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

	data
}