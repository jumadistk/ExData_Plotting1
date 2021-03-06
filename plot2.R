library("data.table")

setwd("~/Course/Exploratory Data Analysis")

#Reads in data 
data_power <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Making a POSIXct date capable of being filtered and graphed by time of day
data_power[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
data_power <- data_power[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x = data_power[, dateTime]
     , y = data_power[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
