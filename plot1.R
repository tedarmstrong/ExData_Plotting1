library(dplyr)

full_dat <- read.csv("household_power_consumption.txt",sep=";")

dat <- filter(full_dat, Date == ("1/2/2007") | Date==('2/2/2007'))

png(filename = "plot1.png")
hist(as.numeric(levels(dat$Global_active_power)[dat$Global_active_power]),
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
