data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[ data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

# Check for missing values
#dim(data[complete.cases(data),])


png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

