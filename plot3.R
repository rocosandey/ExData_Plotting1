## Read the data from csv file
power <- read.csv("household_power_consumption.txt",sep=";")

## Extract only data for 2/1/17 and 2/2/17
power_07 <- power[(power$Date == "2/2/2007" | power$Date == "1/2/2007"),]

## Create a new column with time stamp
power_07 <- within(power_07, {timestamp = as.POSIXct(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S")})

## Cheange column 3 to 9 to numeric
power_07[,3:9] = apply(power_07[,3:9], 2, function(x) as.numeric(as.character(x)))

## Create plot 3
png(filename = "plot3.png", width = 480, height = 480)
plot(power_07$timestamp,power_07$Sub_metering_1,type = "l",xlab="",ylab = "Energy sub metering")
lines(power_07$timestamp,power_07$Sub_metering_2,col = "red")
lines(power_07$timestamp,power_07$Sub_metering_3,col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 0.5, col = c("black","red","blue"))
dev.off()