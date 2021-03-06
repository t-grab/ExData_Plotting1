plot4 <- function() {
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
    
    # Converting the columns "Sub_metering_1" and "Sub_metering_2" to numeric
    data$Sub_metering_1 <- as.character(data$Sub_metering_1)
    data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
    data$Sub_metering_2 <- as.character(data$Sub_metering_2)
    data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
    
    # Converting the column "Global_reactive_power" to numeric
    data$Global_reactive_power <- as.character(data$Global_reactive_power)
    data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
    
    # Converting the column "Voltage" to numeric
    data$Voltage <- as.character(data$Voltage)
    data$Voltage <- as.numeric(data$Voltage)
    
    # Plot
    Sys.setlocale("LC_TIME", "english") # Works only on Windows systems! If your operating system differs,
                                        # please look up the corresponding locale for it.
    
    png(filename="plot4.png", width=480, height=480)
    par(mfrow=c(2,2))
    
    # Global Active Power - Plot
    plot(data$DateTime, data$Global_active_power, xlab="", ylab="Global Active Power", col="black", type="l")
    
    # Voltage - Plot
    plot(data$DateTime, data$Voltage, xlab="datetime", ylab="Voltage", col="black", type="l")
    
    # Enery Sub Metering - Plot
    plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(data$DateTime, data$Sub_metering_2, col="red")
    lines(data$DateTime, data$Sub_metering_3, col="blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), cex=1, bty="n")
    
    # Global Reactive Power - Plot
    plot(data$DateTime, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", col="black", type="l")
    
    dev.off()
}