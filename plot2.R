power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subsetpower <- power[power$Date %in% c("1/2/2007","2/2/2007"), ]

subsetpower_Date <- paste(subsetpower$Date, subsetpower$Time)
Datetime1 <- strptime(subsetpower_Date, "%d/%m/%Y %H:%M:%S")
Global <- as.numeric(subsetpower [ , 3])
plot(x = Datetime1, y = Global,
     type = "l", 
     xlab = "datetime",
     ylab = "Global_active_power (kilowatt)"
)

png("plot2.png", width = 480, height = 480)

dev.off()