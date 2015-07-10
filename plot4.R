plot4 <- function() {
  library("data.table")
  data <-read.table(file = "household_power_consumption.txt", sep=";",header=TRUE, na.strings="?",stringsAsFactors=TRUE)
  aux <- data[(data$Date == "2/2/2007" | data$Date == "1/2/2007"), ]
  aux  <- transform (aux,Global_active_power = as.numeric(Global_active_power))
  aux  <- transform (aux,Global_reactive_power = as.numeric(Global_reactive_power))
  aux  <- transform (aux,Voltage = as.numeric(Voltage))
  aux  <- transform (aux,Sub_metering_1 = as.numeric(Sub_metering_1))
  aux  <- transform (aux,Sub_metering_2 = as.numeric(Sub_metering_2))
  aux  <- transform (aux,Sub_metering_3 = as.numeric(Sub_metering_3))
  aux  <- transform (aux,dateTime = strptime(paste(Date,Time, sep = " "),format = "%d/%m/%Y %H:%M:%S"))
  
  png(filename = "plot4.png",width = 480,height = 480)
  par(mfrow = c(2, 2))
  plot(aux$dateTime,aux$Global_active_power,type ="l",xlab = " ",ylab =  "Global Active Powr (kilowats)")   
  plot(aux$dateTime,aux$Voltage,type ="l",xlab = "datetime",ylab =  "Voltage")   
  plot(aux$dateTime,aux$Sub_metering_1,type = "n", xlab =  " ", ylab =  "Energy sub metering")   
  lines(aux$dateTime,aux$Sub_metering_1,col  = "black")   
  lines(aux$dateTime,aux$Sub_metering_2,col  = "red")   
  lines(aux$dateTime,aux$Sub_metering_3,col  = "blue")  
  legend("topright",bty = "n",lwd  = 2 ,pch = NA, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  plot(aux$dateTime,aux$Global_reactive_power,type ="l",xlab = "datetime",ylab =  "Global_reactive_power")   
  dev.off()
}