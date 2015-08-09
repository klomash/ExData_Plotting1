plot4 <- function()
{
  df <- read.csv.sql("household_power_consumption.txt", sep = ";" ,"select * from file where Date = \"1/2/2007\" OR Date = \"2/2/2007\"")
  closeAllConnections()
  df[,"Date"] <- as.Date(df[,"Date"],"%d/%m/%Y")
  df[,"DateTime"] <- as.POSIXct(paste(df[,"Date"], df[,"Time"]), format = "%Y-%m-%d %H:%M:%S")  
  png(filename = "plot4.png", bg = "transparent")
  par(mfrow = c(2,2))
  plot(df$DateTime, df$Global_active_power, type = "l", col = "black",
       main = "", xlab = "", ylab = "Global Active Power")
  plot(df$DateTime, df$Voltage, type = "l", col = "black",
       main = "", xlab = "datetime", ylab = "Voltage")
  plot(df$DateTime, df$Sub_metering_1, type = "l", col = "black",
       main = "", xlab = "", ylab = "Energy sub metering")
  lines(df$DateTime, df$Sub_metering_2, col = "red")
  lines(df$DateTime, df$Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), border = "white", bty = "n")
  plot(df$DateTime, df$Global_reactive_power, type = "l", col = "black",
       main = "", xlab = "datetime", ylab = "Global_reactive_power")
  dev.off()
}