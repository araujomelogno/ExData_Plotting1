plot1 <- function() {
  library("data.table")
  data <-fread("household_power_consumption.txt", sep=";",header=TRUE, na.strings="?",stringsAsFactors=FALSE, verbose=FALSE)
  aux <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007") ]
  aux  <- transform (aux,Global_active_power = as.numeric(Global_active_power))
  
  png(filename = "plot1.png",width = 480,height = 480)
  hist(aux$Global_active_power,xlab = "Global Active Power (kilowatts)",col ="red", main = "Global Active Power")
  dev.off()
}