plot2 <- function() {
    # Reading the data
    data <- read.csv("household_power_consumption.txt", sep=";")
    
    # Subsetting data to the desired date range
    data$Date <- as.character(data$Date)
    data$Date <- as.Date(data$Date, "%d/%m/%Y")
    data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]
    
    # Converting the columns "Date" and "Time" to POSIXct
    data$Date <- as.character(data$Date)
    data$Time <- as.character(data$Time)
    DateTime <- paste(data$Date, data$Time)
    DateTime <- strptime(DateTime, "%Y-%m-%d %H:%M:%S")
    
    data <- cbind(DateTime, data)
    data <- data[c(-2,-3)]
    
    # Converting the column "Global_active_power" to numeric
    data$Global_active_power <- as.character(data$Global_active_power)
    data$Global_active_power <- as.numeric(data$Global_active_power)
    
    # Plot
    Sys.setlocale("LC_TIME", "english") # Works only on Windows Systems! If your operating systems differs
                                        # plese look up the corresponding locale for it.
    png(filename="plot2.png", width=480, height=480)
    plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
}