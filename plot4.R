data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[ data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
data$Time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(data$Time, data$Global_active_power, type = "line", ylab = "Global Active Power", xlab = "")

plot(data$Time, data$Voltage, type = "line", ylab = "Voltage", xlab = "datetime")

plot(data$Time, data$Sub_metering_1, type = "line", col="black",  ylab = "Energy sub metering", xlab = "")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n", cex=1, pt.cex = 1, y.intersp=0.8)

plot(data$Time, data$Global_reactive_power, type = "line", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()

