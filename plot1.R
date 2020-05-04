file <- "./data/household_power_consumption.txt"
data <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# plot1
plot1 <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(plot1, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()