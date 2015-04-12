## Introduction

This repository is a fork of the [ExData_Plotting1]() repository, and used for
the first project assignment in the [Exploratory Data Analysis]() course.
The goal of the first project assignment is to get to know the base plotting
system in R.

### Prerequisites

This assigment expects that the `household_power_consumption.txt` file from the
[Electric power consumption dataset](https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip) is available under the `data` directory.

### Dataset

The "Individual household electric power consumption Data Set" from the
`household_power_consumption.txt` file. Contains the measurements of electric
power consumption in one household with a one-minute sampling rate over a period
of almost 4 years. Different electrical quantities and some sub-metering values are available.

It holds the following 9 variables as described in the [UCI
web site](https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption):

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

1. **Date:** Date in format dd/mm/yyyy
2. **Time:** time in format hh:mm:ss
3. **Global_active_power:** household global minute-averaged active power (in kilowatt)
4. **Global_reactive_power:** household global minute-averaged reactive power (in kilowatt)
5. **Voltage:** minute-averaged voltage (in volt)
6. **Global_intensity:** household global minute-averaged current intensity (in ampere)
7. **Sub_metering_1:** energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
8. **Sub_metering_2:** energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
9. **Sub_metering_3:** energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.


## Plots

We have the following four plots:

1. **plot1.png**: Histogram of the "Global Active power"" created by the `plot1.R` script.
2. **plot2.png**: Plot of the "Global Active power" over the timespan `01-02-2007` to `02-02-2007`, created by the `plot2.R` script.
3. **plot3.png**: Plot of all the "Sub metering" column values over the timespan `01-02-2007` to `02-02-2007`, created by the `plot3.R` script.
4. **plot4.png**: A 2x2 grid that holds the following four plots
	* "Global active power" over the timespan `01-02-2007` to `02-02-2007`
	* "Voltage" over the timespan `01-02-2007` to `02-02-2007`
	* "Energy sub metering" over the timespan `01-02-2007` to `02-02-2007`
	* "Global Reactive power" over the timespan `01-02-2007` to `02-02-2007`

If you wish to re-create the plots make sure that the prerequisites are met and the run the plot scripts.

## Scripts

In addition to each of the `plot1.R`, `plot2.R`, `plot3.R` and `plot4.R` scripts
used to create each of the before amentioned png plots we have the following two
`R` scripts.

1. **prerequisites.R**: It makes sure that the `household_power_consumption.txt` file exists under the `data` directory. It will create in addition a processed file named `household_power_consumption_processed.txt` once, that only holds the data for the timespan `01-02-2007` to `02-02-2007`. Thus enabling faster load and processing of the data execution from the plot scripts.
2. **readdata.R**: provides a `readdata` function that will read the "Individual household electric power consumption" dataset and return a processed dataset.

Each of the `plotX.R` script contains the following code:

```
source('./prerequisites.R')
source('./readdata.R')
data <- readdata('./data/household_power_consumption_processed.txt')
```

First they make sure the __prerequisites__ are met, then load and make the
`readdata` function available. Finally loading the dataset from the
`./data/household_power_consumption_processed.txt` created by the
`prerequisistes` script into the a dataframe hold by the `data` variable.
Which is then subsequently used in each of `plotX.R` scripts to create the plots.


### Running the scripts

You can run each of the scripts from the __cmdline__ i.e.

```
>./plot1.R
```

Or from __RStudio__:

```
>source("./plot1.R")
```

Running the `plot1.R` script from either the __cmdline__ or __RStudio__ will
re-create the `plot1.png` file. Replace `plot1.R` script with either the
`plot2.R`, `plot3.R` or `plot4.R` to re-create the other plots png files.


