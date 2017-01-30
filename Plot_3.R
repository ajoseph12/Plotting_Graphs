library(dplyr)
library(lubridate)
house<- fread("household_power_consumption.txt",header = TRUE, nrows = 70000)
house$Date_and_Time<- paste(house$Date,house$Time)
house$Date_and_Time<- dmy_hms(house$Date_and_Time)
Date1<- ymd_hms("20070201 000000")
Date2<- ymd_hms("20070202 235900")
extract<- filter(house, Date_and_Time >= Date1 & Date_and_Time <= Date2)
extract$Global_active_power<- as.numeric(extract$Global_active_power)
par(bg= "grey")
with(extract,{
  plot(extract$Date_and_Time,extract$Sub_metering_1, pch =".", xlab = "",ylab = "Energy sub metering")
  lines(Date_and_Time[order(Date_and_Time)],Sub_metering_1[order(Date_and_Time)],xlim=range(Date_and_Time), ylim=range(Sub_metering_1), pch=16)
  lines(Date_and_Time[order(Date_and_Time)],Sub_metering_2[order(Date_and_Time)],xlim=range(Date_and_Time), ylim=range(Sub_metering_2), pch=16, col = "red")
  lines(Date_and_Time[order(Date_and_Time)],Sub_metering_3[order(Date_and_Time)],xlim=range(Date_and_Time), ylim=range(Sub_metering_3), pch=16, col = "blue")}
     )
legend("topright", lty = 1, col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
png(filename = "plot_3.png", width = 480, height = 480,units = "px")
par(bg= "grey")
with(extract,{
  plot(extract$Date_and_Time,extract$Sub_metering_1, pch =".", xlab = "",ylab = "Energy sub metering")
  lines(Date_and_Time[order(Date_and_Time)],Sub_metering_1[order(Date_and_Time)],xlim=range(Date_and_Time), ylim=range(Sub_metering_1), pch=16)
  lines(Date_and_Time[order(Date_and_Time)],Sub_metering_2[order(Date_and_Time)],xlim=range(Date_and_Time), ylim=range(Sub_metering_2), pch=16, col = "red")
  lines(Date_and_Time[order(Date_and_Time)],Sub_metering_3[order(Date_and_Time)],xlim=range(Date_and_Time), ylim=range(Sub_metering_3), pch=16, col = "blue")}
)
legend("topright", lty = 1, col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


