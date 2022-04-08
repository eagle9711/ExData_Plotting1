# Load data

rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Clean data

rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
data2007<- na.omit(subset(rawData, Date>= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))) 


#Plot4

data2007$dateTime <- paste(data2007$Date, data2007$Time)
data2007$dateTime <- as.POSIXct(data2007$dateTime)

par(mfrow=c(2,2))

#4-1
plot(data2007$Global_active_power~data2007$dateTime, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
#4-2
plot(data2007$Voltage~data2007$dateTime, type="l",
     xlab="", ylab="Voltage (volt)")
#4-3
plot(data2007$Sub_metering_1~data2007$dateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data2007$Sub_metering_2~data2007$dateTime, col="red")
lines(data2007$Sub_metering_3~data2007$dateTime, col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=c(1,1,1))
#4-4
plot(data2007$Global_reactive_power~data2007$dateTime, type="l",
     xlab="", ylab="Global Rective Power (kilowatts)")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()