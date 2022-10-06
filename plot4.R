# load the data into R
varClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
dataset <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", colClasses = varClasses, stringsAsFactors = FALSE, na.strings = "?")

# convert the Data variable into Date class
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

# extract the subset with Data equals to "2007-02-01" or "2007-02-02"
dataset <- subset(dataset, dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02", )

# convert the Date and Time variables into Date/Time class
datetime <- paste(dataset$Date,dataset$Time)
datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

# set plot4.png as a requested format
png(file = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2), mar = c(4,4,1,1))
with(dataset, {
  plot (datetime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "n")
  lines(datetime, Global_active_power)
  
  plot (datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
  lines(datetime, Sub_metering_1)
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot (datetime, Voltage, ylab = "Voltage", type = "n")
  lines(datetime, Voltage)
  
  plot (datetime, Global_reactive_power, ylab = "Global_reactive_power", type = "n")
  lines(datetime, Global_reactive_power) 
  }
)
dev.off()