plot2 <- function() {
  library("data.table")
  data <-read.table(file = "household_power_consumption.txt", sep=";",header=TRUE, na.strings="?",stringsAsFactors=TRUE)
  aux <- data[(data$Date == "2/2/2007" | data$Date == "1/2/2007"), ]
  aux  <- transform (aux,Global_active_power = as.numeric(Global_active_power))
  aux  <- transform (aux,weekDays =weekdays(as.Date(Date,format = "%d/%m/%Y")))
  aux  <- transform (aux,dateTime = strptime(paste(Date,Time, sep = " "),format = "%d/%m/%Y %H:%M:%S"))
  
  png(filename = "plot2.png",width = 480,height = 480)
  plot(aux$dateTime,aux$Global_active_power,type ="l",xlab = " ",ylab =  "Global Active Powr (kilowats)")   
  dev.off()
}