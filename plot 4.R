library(plyr)
library(dplyr)
library (lattice)
library(reshape2)



powerData <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")


febData <- filter(powerData,Date %in% c("1/2/2007","2/2/2007")) 
febData$DateTime <- strptime(paste(febData$Date,febData$Time),"%d/%m/%Y %H:%M:%S")

png("plot4.png",width=480,height=480)

par(mfcol=c(2,2))


plot(febData$DateTime, febData$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)


plot(febData$DateTime, febData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(febData$DateTime, febData$Sub_metering_2, col="red")
lines(febData$DateTime, febData$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


plot(febData$DateTime, febData$Voltage, type="l", xlab="datetime", ylab="Voltage")


plot (febData$DateTime, febData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()