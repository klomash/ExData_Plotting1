plot2 <- function()
{
  df <- read.csv.sql("household_power_consumption.txt", sep = ";" ,"select * from file where Date = \"1/2/2007\" OR Date = \"2/2/2007\"")
  closeAllConnections()
  df[,"Date"] <- as.Date(df[,"Date"],"%d/%m/%Y")
  df[,"DateTime"] <- as.POSIXct(paste(df[,"Date"], df[,"Time"]), format = "%Y-%m-%d %H:%M:%S")  
  png(filename = "plot2.png", bg = "transparent")
  plot(df$DateTime, df$Global_active_power, type = "l", 
       main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
}
