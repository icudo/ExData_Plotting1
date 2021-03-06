## Get the dataset
data_full <- read.table('household_power_consumption.txt',
                        header = TRUE,
                        sep = ";",
                        colClasses = c("character", "character", rep("numeric",7)),
                        na = "?")

## get the data only from 2007-02-01 to 2007-02-02 
subset <- Date == "1/2/2007" | Date == "2/2/2007"
data <- data_full[subset, ]

x <- paste(Date, Time)

## Converting dates
data$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

## Plot 2
plot(DateTime, Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
