library(plyr)
library(dplyr)
library (lattice)
library(reshape2)

powerData<-read.csv("household_power_consumption.txt",sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")


febData <- filter(powerData,Date %in% c("1/2/2007","2/2/2007")) 
febData$DateTime <- strptime(paste(febData$Date,febData$Time),"%d/%m/%Y %H:%M:%S")
png("plot2.png",width=480,height=480)
plot(febData$DateTime, febData$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()