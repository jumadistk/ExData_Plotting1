library("data.table")

setwd("~/Course/Exploratory Data Analysis")

#Reads in data 
data_power <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Change Date Column to Date Type
data_power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
data_power <- data_power[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(data_power[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
