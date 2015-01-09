Sys.setlocale("LC_TIME", "English")
datos <- read.csv2(file="data/household_power_consumption.txt",stringsAsFactors=FALSE)
#subset We will only be using data from the dates 2007-02-01 and 2007-02-02
datos_sub <- subset(datos,Date %in% c("1/2/2007","2/2/2007"))
# transform column pasting date an time  and the use to create Date/Time objects
datos_sub$Date = strptime(paste(datos_sub$Date,datos_sub$Time),"%d/%m/%Y %H:%M:%S")
#plot
par(mfrow = c(2, 2))
with(datos_sub,{
  plot(datos_sub$Date,Global_active_power,typ="l",
       ylab = "Global Active Power",
       xlab=""
  )  
  plot(datos_sub$Date,Voltage,typ="l",
       ylab = "Voltage",
       xlab="datetime"
  )
  plot(datos_sub$Date,Sub_metering_1,typ="l",
       ylab = "Energy Sub metering",
       xlab = "" 
  )
  points(datos_sub$Date,Sub_metering_2,col="red",typ="l")
  points(datos_sub$Date,Sub_metering_3,col="blue",typ="l")
  
  plot(datos_sub$Date,Global_reactive_power,typ="l",
       ylab = "Global_reactive_power",
       xlab="datetime"
  )    
})
## Copy my plot to a PNG file
dev.copy(png, file = "plot4.png",width = 480, height = 480) 
dev.off()