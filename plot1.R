data3<- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
library(chron)
Sys.setlocale("LC_TIME","English_United States.1252")
data1 <- data3[(data3$Date == "2/2/2007" | data3$Date == "1/2/2007"),]

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
## Convert data1$Time from Char to Time Class (require CHRON Library)
data1$Time <- strptime(data1$Time, "%H:%M:%S") ## Convert to Time:POSIXlt
data1$Time <- times(format(data1$Time, "%H:%M:%S")) ## Convert to Time class

## Plot the chart
png(file = "plot1.png", width = 480, height = 480)
par(bg=NA) # Set chart background color to Transparent
hist(data1$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red"
)
dev.off()