plot1<-function()
{
  power <- read.csv("household_power_consumption.txt", sep=";")
  power$Date=as.Date(power$Date, "%d/%m/%Y")
  p<-power[power$Date>='2007-02-01'&power$Date<='2007-02-02', ]
  p2<-mutate(p, dateTime=as.POSIXct(paste(p$Date, p$Time), format="%Y-%m-%d %H:%M:%S"))
  p2$Global_active_power<-as.character(p2$Global_active_power)
  p2$Global_active_power<-as.numeric(p2$Global_active_power)
  p2$Sub_metering_1<-as.character(p2$Sub_metering_1)
  p2$Sub_metering_1<-as.numeric(p2$Sub_metering_1)
  p2$Sub_metering_2<-as.character(p2$Sub_metering_2)
  p2$Sub_metering_2<-as.numeric(p2$Sub_metering_2)
  p2$Sub_metering_3<-as.character(p2$Sub_metering_3)
  p2$Sub_metering_3<-as.numeric(p2$Sub_metering_3)
  p2$Voltage<-as.character(p2$Voltage)
  p2$Voltage<-as.numeric(p2$Voltage)
  p2$Global_reactive_power<-as.character(p2$Global_reactive_power)
  p2$Global_reactive_power<-as.numeric(p2$Global_reactive_power)

  hist(p2$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png")
  dev.off()
}
