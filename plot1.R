# Load data

rawData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Clean data

rawData$Date <- as.Date(rawData$Date, "%d/%m/%Y")
data2007<- na.omit(subset(rawData, Date>= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))) 

#Plot1

hist(data2007$Global_active_power, main = "Global Active Power", col="red", 
     xlab="Global Active Power (kilowatts)")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()