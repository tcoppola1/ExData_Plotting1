file <- "./data/household_power_consumption.txt"
data <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot data
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data$Global_active_power)
globalReactivePower <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
sub1 <- as.numeric(data$Sub_metering_1)
sub2 <- as.numeric(data$Sub_metering_2)
sub3 <- as.numeric(data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
#1st graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#top right graph
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#bottom left
plot(datetime, sub1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub2, type="l", col="red")
lines(datetime, sub3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#bottom right
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()