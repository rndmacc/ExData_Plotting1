# import data from csv-file
data=read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)

# extract relevant days
indices = data[["Date"]] == "1/2/2007" | data[["Date"]] == "2/2/2007"
data=data[indices, ]

# convert columns to numeric values
for (column in 3:8) {
  data[[column]]=as.numeric(data[[column]])
}

# create and save histogram
png("plot1.png", width=480, height=480)
hist(data[["Global_active_power"]], main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
