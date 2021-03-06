# import data from csv-file
data=read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

# extract relevant days
indices = data[["Date"]] == "1/2/2007" | data[["Date"]] == "2/2/2007"
data=data[indices, ]

# convert columns to numeric values
for (column in 3:8) {
  data[[column]]=as.numeric(data[[column]])
}

# create and save plot
png("plot3.png", width=480, height=480)
datetime = strptime(paste(data[["Date"]], data[["Time"]], sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, data[["Sub_metering_1"]], type="l",xlab="", ylab="Energy sub metering", col="black")
lines(datetime, data[["Sub_metering_2"]], type="l", col="red")
lines(datetime, data[["Sub_metering_3"]], type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()