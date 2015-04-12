## Plot Household global minute-averaged active power (in kilowatt)
# Loading the data
library(data.table)
filename<-"household_power_consumption.txt"
HHP<-fread(filename, header=T, stringsAsFactors=F)
HHP<-as.data.frame(HHP)

# Transforming date/time variables
HHP$Date<-as.Date(HHP$Date, format="%d/%m/%Y")
HHP$Time<-strptime(HHP$Time, format="%H:%M:%S")

# Subsetting the data to period of analysis
Sub_HHP<-subset(HHP, HHP$Date >="2007-02-01" & HHP$Date<="2007-02-02")
rm(HHP)

Sub_HHP$Global_active_power<-as.numeric(Sub_HHP$Global_active_power)

## Plot 1: Household global minute-averaged active power (in kilowatt)
hist(Sub_HHP$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()