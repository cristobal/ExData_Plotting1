#!/usr/bin/env Rscript
# Immediately-invoked function expression
(function () {
	# Ensure that the household power consumtion file is available
	# if not terminate early
	dataFile <- "./data/household_power_consumption.txt"
	if (!file.exists(dataFile)) {
		if (!file.exists("./data")) {
			dir.create("./data")
		}
		print(paste("No such file data/household_power_consumption.txt,",
								"please download the household_power_consumption.txt dataset from:",
								"https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip",
								" and put it into the data folder."))
		quit("yes")
	}

	# Create a processed household power consumption file that only contains
	# the data for the date range 01-02-2007 to 02-02-2007
	processedFile <- './data/household_power_consumption_processed.txt'
	if (!file.exists(processedFile)) {
		print ("Tidying `data/household_power_consumption.txt` file.")
		inFile  <- file(dataFile, 'r')
		outFile <- file(processedFile, 'w+')

		# write header from inFile to outFile
		writeLines(readLines(inFile, n = 1), outFile)

		# loop over lines and put every line that matches our
		# date pattern for 01-02-2007 and 02-02-2007
		# when we hit 03-02-2007 we have no more matches and break out of the
		# while loop.
		pattern <- '^(1/2/2007|2/2/2007)'
		flag    <- F
		while(length(line <- readLines(inFile, n = 1)) > 0) {
			if (grepl(pattern, line)) {
				writeLines(line, outFile)
				flag <- T
			}
			else if (flag) {
				break
			}
		}
		print ("done")
		close(inFile)
		close(outFile)
	}
})()