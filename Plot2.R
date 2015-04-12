## Plot Household global minute-averaged active power (in kilowatt)
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


## Plot 2: Household global minute-averaged active power (in kilowatt)
plot(Sub_HHP$Date_Time, Sub_HHP$Global_active_power,  xlab="", ylab="Global Active Power (kilowatts)", type="l")


## Saving to file
dev.copy(png, file="Plot2.png", height=480, width=480, units = "px")
dev.off()