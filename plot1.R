plot1 <- function()
{
  df <- read.csv.sql("household_power_consumption.txt", sep = ";" ,"select * from file where Date = \"1/2/2007\" OR Date = \"2/2/2007\"")
  closeAllConnections()
  png(filename = "plot1.png", bg = "transparent")
  hist(df$Global_active_power, col = "red", 
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
}