###Load the file (semicolon separated values) interpreting the "?" as NA
powerconsumption <- read.table("household_power_consumption.txt", sep = ";",header = T, na.strings = "?",stringsAsFactors = F)

##Change class of the Date and Time variables
powerconsumption$DateTime <- strptime(with(powerconsumption,paste(Date,Time,sep = " ")),format = "%d/%m/%Y %H:%M:%S")
library(lubridate)
powerconsumption$Date <- as.Date(powerconsumption$DateTime,format = "%d/%m/%Y")
powerconsumption$Time <- hms(powerconsumption$Time)

## subset the rows to select the period of time between 2007/02/01 - 2007/02/02
pcsubsetted <- subset(powerconsumption, Date >="2007-02-01" & Date <="2007-02-02")

##Plot 1
png("plot1.png", width = 480, height = 480)
with(pcsubsetted, hist(Global_active_power, xlab = "Global Active Power (kilowatts)",
                       col = "red", main = "Global Active Power"))
dev.off()