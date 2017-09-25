data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[ data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
data$Time <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")


png(filename = "plot2.png", width = 480, height = 480)
plot(data$Time, data$Global_active_power, type = "line", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()


