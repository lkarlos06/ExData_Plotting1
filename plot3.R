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

# set plot3.png as a requested format
png(file = "plot3.png", width = 480, height = 480)
with(dataset, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(dataset, lines(datetime, Sub_metering_1))
with(dataset, lines(datetime, Sub_metering_2, col="red"))
with(dataset, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()