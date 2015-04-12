## Plot sub_mettering
# Loading the data
library(data.table)
filename<-"household_power_consumption.txt"
HHP<-fread(filename, header=T, stringsAsFactors=F, na.strings="?")
HHP<-as.data.frame(HHP)

# Subsetting the data to period of analysis
Sub_HHP<-subset(HHP, HHP$Date =="1/2/2007" | HHP$Date=="2/2/2007")
rm(HHP)

# Creating a Date/Time variable
Sub_HHP$Date <- as.Date(Sub_HHP$Date, format="%d/%m/%Y")
Sub_HHP$Date_Time <- paste(Sub_HHP$Date, Sub_HHP$Time)
Sub_HHP$Date_Time <- as.POSIXct(Sub_HHP$Date_Time, format="%Y-%m-%d %H:%M:%S")

Sub_HHP$Global_active_power<-as.numeric(Sub_HHP$Global_active_power)
Sub_HHP$Sub_metering_1<-as.numeric(Sub_HHP$Sub_metering_1)
Sub_HHP$Sub_metering_2<-as.numeric(Sub_HHP$Sub_metering_2)
Sub_HHP$Sub_metering_2<-as.numeric(Sub_HHP$Sub_metering_2)
Sub_HHP$Voltage<-as.numeric(Sub_HHP$Voltage)


## Plot 3 : Sub_metering
par(mfrow=c(2,2))
with(Sub_HHP,{
    plot(Date_Time, Global_active_power, type='l', ylab='Global Active Power', xlab='')
    plot(Date_Time, Voltage, type='l', xlab='datetime')
    
    plot(Date_Time, Sub_metering_1, type='l', col='black', ylab='Energy sub metering', xlab='')
    lines(Date_Time, Sub_metering_2, type='l', col='red')
    lines(Date_Time, Sub_metering_3, type='l', col='blue')
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'), bty='n')
    
    plot(Date_Time, Global_reactive_power, type='l', xlab='datetime')
})

## Saving to file
dev.copy(png, file="Plot4.png", height=480, width=480, units = "px")
dev.off()