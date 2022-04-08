# Load data

rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Clean data

rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
data2007<- na.omit(subset(rawData, Date>= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))) 

#Plot2
data2007$dateTime <- paste(data2007$Date, data2007$Time)
data2007$dateTime <- as.POSIXct(data2007$dateTime)

plot(data2007$Global_active_power~data2007$dateTime, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
