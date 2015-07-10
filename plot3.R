plot3 <- function() {
  library("data.table")
  data <-read.table(file = "household_power_consumption.txt", sep=";",header=TRUE, na.strings="?",stringsAsFactors=TRUE)
  aux <- data[(data$Date == "2/2/2007" | data$Date == "1/2/2007"), ]
  aux  <- transform (aux,Sub_metering_1 = as.numeric(Sub_metering_1))
  aux  <- transform (aux,Sub_metering_2 = as.numeric(Sub_metering_2))
  aux  <- transform (aux,Sub_metering_3 = as.numeric(Sub_metering_3))
  aux  <- transform (aux,dateTime = strptime(paste(Date,Time, sep = " "),format = "%d/%m/%Y %H:%M:%S"))
  
  png(filename = "plot3.png",width = 480,height = 480)
  plot(aux$dateTime,aux$Sub_metering_1,type = "n", xlab =  " ", ylab =  "Energy sub metering")   
  lines(aux$dateTime,aux$Sub_metering_1,col  = "black")   
  lines(aux$dateTime,aux$Sub_metering_2,col  = "red")   
  lines(aux$dateTime,aux$Sub_metering_3,col  = "blue")  
  legend("topright",lwd  = 2 ,pch = NA, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
}