##------
##Plot 4
##------

##create the file and the layout of the plot
png("plot4.png")
par(mfcol=c(2,2))

##1) top left
plot(DateTime,Global_active_power,type="l",ylab="Global active power (kilowatts)",xlab="")

##2) bottom left
plot(DateTime,Sub_metering_1,type="l",ylab="",xlab="")
lines(DateTime,Sub_metering_2,type="l",col="red")
lines(DateTime,Sub_metering_3,type="l",col="blue")
title(ylab="Energy sub metering")
legend("topright",lty=1, col = c("black", "red","blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

##3) top right
plot(DateTime,Global_reactive_power,type="l")

##4) bottom right
plot(DateTime,Voltage,type="l")

##closing
dev.off()
graphics.off()