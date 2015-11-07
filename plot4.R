library(dplyr)

full_dat <- read.csv("household_power_consumption.txt",sep=";")

dat <- filter(full_dat, Date == ("1/2/2007") | Date==('2/2/2007'))
datetime <- strptime(paste((levels(dat$Date)[dat$Date]),(levels(dat$Time)[dat$Time]), sep = " ", collapse = NULL),"%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(datetime,as.numeric(levels(dat$Global_active_power)[dat$Global_active_power]),type="l",
     xlab ="", ylab="Global Active Power")
plot(datetime,as.numeric(levels(dat$Voltage)[dat$Voltage]),type="l",
     xlab ="datetime", ylab="Voltage")
plot(datetime,as.numeric(levels(dat$Sub_metering_1)[dat$Sub_metering_1]),type="l",
     xlab = "", ylab = "Energy sub metering")
lines(datetime,as.numeric(levels(dat$Sub_metering_2)[dat$Sub_metering_2]), col = "red")
lines(datetime,dat$Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"),bty="n")
plot(datetime,as.numeric(levels(dat$Global_reactive_power)[dat$Global_reactive_power]),
     type="l", xlab ="datetime", ylab="Global_reactive_power")
dev.off()
