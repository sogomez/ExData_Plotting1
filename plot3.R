plot3<-function()
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
  
  plot(p2$dateTime,p2$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering")
  lines(p2$dateTime,p2$Sub_metering_2,col="red")
  lines(p2$dateTime,p2$Sub_metering_3,col="blue")
  legend("topright", col = c("black", "red", "blue"), , lty=c(1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  dev.copy(png, file="plot3.png")
  dev.off()
}

