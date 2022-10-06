
# load data
varClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
dataset <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", colClasses = varClasses, stringsAsFactors = FALSE, na.strings = "?")

# convert the Data variable into Date class
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

# extract subset equals to "2007-02-01" or "2007-02-02"
dataset <- subset(dataset, dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02")

# plot1.png as a requested format
png(file = "plot1.png", width = 480, height = 480)
hist(dataset$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()