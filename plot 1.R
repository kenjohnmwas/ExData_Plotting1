library(plyr)
library(dplyr)
library (lattice)
library(reshape2)

powerData<-read.csv("household_power_consumption.txt",sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")

febData <- subset(powerData, Date == '2/2/2007' | Date == '1/2/2007')

png("plot1.png", width = 480, height = 480, units = "px")

hist(febData$Global_active_power, main="Global Active Power", col="red", xlab = "Global Active Power(kilowatts)")

dev.off()
