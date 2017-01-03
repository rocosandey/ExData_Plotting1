## Read the data from csv file
power <- read.csv("household_power_consumption.txt",sep=";")

## Extract only data for 2/1/17 and 2/2/17
power_07 <- power[(power$Date == "2/2/2007" | power$Date == "1/2/2007"),]

## Create a new column with time stamp
power_07 <- within(power_07, {timestamp = as.POSIXct(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S")})

## Cheange column 3 to 9 to numeric
power_07[,3:9] = apply(power_07[,3:9], 2, function(x) as.numeric(as.character(x)))

## Create plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(power_07$timestamp,power_07$Global_active_power,type = "l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()