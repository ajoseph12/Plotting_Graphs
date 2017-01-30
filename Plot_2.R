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
  plot(Date_and_Time,Global_active_power, pch = ".",xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(Date_and_Time[order(Date_and_Time)], Global_active_power[order(Date_and_Time)], xlim=range(Date_and_Time), ylim=range(Global_active_power), pch=16)}
)
png(filename = "plot_2.png", width = 480, height = 480,units = "px")
par(bg= "grey")
with(extract,{
  plot(Date_and_Time,Global_active_power, pch = ".",xlab = "", ylab = "Global Active Power (kilowatts)")
  lines(Date_and_Time[order(Date_and_Time)], Global_active_power[order(Date_and_Time)], xlim=range(Date_and_Time), ylim=range(Global_active_power), pch=16)}
)
dev.off()