##-------
## Plot 3
##-------
png("plot3.png")
plot(DateTime,Sub_metering_1,type="l",ylab="",xlab="")
lines(DateTime,Sub_metering_2,type="l",col="red")
lines(DateTime,Sub_metering_3,type="l",col="blue")
title(ylab="Energy sub metering")
legend("topright",lty=1, col = c("black", "red","blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
dev.off()

