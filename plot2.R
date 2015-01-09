Sys.setlocale("LC_TIME", "English")
par(mfrow = c(1, 1))
#get data
datos <- read.csv2(file="data/household_power_consumption.txt",stringsAsFactors=FALSE)
#subset We will only be using data from the dates 2007-02-01 and 2007-02-02
datos_sub <- subset(datos,Date %in% c("1/2/2007","2/2/2007"))
# transform column pasting date an time  and the use to create Date/Time objects
datos_sub$Date = strptime(paste(datos_sub$Date,datos_sub$Time),"%d/%m/%Y %H:%M:%S")
#plot
with(datos_sub, 
     plot(datos_sub$Date,Global_active_power,typ="l",
          ylab = "Global Active Power (Kilowatts)",
          xlab=""
     )  
)
## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png",width = 480, height = 480) 
dev.off()