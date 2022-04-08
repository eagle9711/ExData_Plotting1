# Load data

rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Clean data

rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
data2007<- na.omit(subset(rawData, Date>= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))) 

#Plot3

data2007$dateTime <- paste(data2007$Date, data2007$Time)
data2007$dateTime <- as.POSIXct(data2007$dateTime)

plot(data2007$Sub_metering_1~data2007$dateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
lines(data2007$Sub_metering_2~data2007$dateTime, col="red")
lines(data2007$Sub_metering_3~data2007$dateTime, col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=c(1,1,1))

dev.copy(png,"plot3.png", width=480, height=480)
dev.off()