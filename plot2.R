library(ggplot2)
library(lattice)

## Download and open file
zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
wd <- getwd()
download.file(zipUrl, file.path(wd, "File.zip"))
unzip(file.path("File.zip"))
csvFile <- read.table("household_power_consumption.txt",  header = TRUE, sep = ";", dec = ".", na.strings = "?")
csvFile$Date <- as.Date( csvFile$Date, tryFormats = "%d/%m/%Y" )
csvFile <- subset(csvFile, Date == "2007-02-01" | Date == "2007-02-02")
csvFile$fulldate <- with(csvFile, paste(Date, Time, sep = " "))
csvFile$fulldate <- as.POSIXct(csvFile$fulldate)

png(filename="plot2.png")
with(csvFile, plot(fulldate, Global_active_power, type = "l", ylab = "Global Active Power (Kilowatts)") )
dev.off()