library(dplyr)

full_dat <- read.csv("household_power_consumption.txt",sep=";")

dat <- filter(full_dat, Date == ("1/2/2007") | Date==('2/2/2007'))
datetime <- strptime(paste((levels(dat$Date)[dat$Date]),(levels(dat$Time)[dat$Time]), sep = " ", collapse = NULL),"%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png")
plot(datetime,as.numeric(levels(dat$Global_active_power)[dat$Global_active_power]),type="l",
     xlab ="", ylab="Global Active Power (kilowatts)")
dev.off()
