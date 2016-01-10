data3<- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
library(chron)
Sys.setlocale("LC_TIME","English_United States.1252")
data1 <- data3[(data3$Date == "2/2/2007" | data3$Date == "1/2/2007"),]

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
## Convert data1$Time from Char to Time Class (require CHRON Library)
data1$Time <- strptime(data1$Time, "%H:%M:%S") ## Convert to Time:POSIXlt
data1$Time <- times(format(data1$Time, "%H:%M:%S")) ## Convert to Time class


data1 <- within(data1,{timestamp=format(as.POSIXct(paste(data1$Date,data1$Time)),"%d/%m/%Y %H:%M:%S")})
data1$timestamp <- strptime(data1$timestamp, "%d/%m/%Y %H:%M:%S")


## Plot the chart
png(file = "plot2.png", width = 480, height = 480)
par(bg=NA) # Set chart background color to Transparent
with(data1, plot(timestamp, data1$Global_active_power, 
                 type="l",xlab="",
                 ylab="Global Active Power (kilowatts)"))
dev.off()


par(bg=NA)
with(data1, plot(timestamp,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"),col=1)
with(data1, lines(timestamp,Sub_metering_2,col="red"))
with(data1, lines(timestamp,Sub_metering_3,col="blue"))
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1,1),col=c(1,2,4))
#
