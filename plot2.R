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
png("plot2.png", width=480, height=480)
datetime = strptime(paste(data[["Date"]], data[["Time"]], sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, data[["Global_active_power"]], xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()