power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subsetpower <- power[power$Date %in% c("1/2/2007","2/2/2007"), ]

subsetpower_Date <- paste(subsetpower$Date, subset$Time)
Datetime1 <- strptime(subsetpower_Date, "%d/%m/%Y %H:%M:%S")
Global <- as.numeric(as.character(subsetpower [ , 3]))
Voltage <- as.numeric(as.character(subsetpower [ , 5]))
Global_reac <- as.numeric(as.character(subsetpower [ , 4]))
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(x = Datetime1, y = Global, type = "l", xlab = "", ylab = "Global")
plot(x = Datetime1, y = Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

Sub_metering_1 <- as.numeric(subsetpower [ , 7])
Sub_metering_2 <- as.numeric(subsetpower [ , 8])
Sub_metering_3 <- as.numeric(subsetpower [ , 9])

plot(Datetime1, Sub_metering_1,
     type = "l",
     lwd = 1, ylab = "Energy Sub Metering")
lines(Datetime1, Sub_metering_2,
      type = "l",
      lwd = 1,
      col = "red")
lines(Datetime1, Sub_metering_3,
      type = "l",
      lwd = 1,
      col = "blue")
legend("topright", pch = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))

plot(x = Datetime1, y = Global_reac, type = "l", xlab = "datetime", ylab = "Voltage")

dev.off()
