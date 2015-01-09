Sys.setlocale("LC_TIME", "English")
par(mfrow = c(1, 1))
datos <- read.csv2(file="data/household_power_consumption.txt",stringsAsFactors=FALSE)
#subset We will only be using data from the dates 2007-02-01 and 2007-02-02
datos_sub <- subset(datos,Date %in% c("1/2/2007","2/2/2007"))
#plot
hist(as.numeric(datos_sub$Global_active_power), 
     col = "red",
     main="Global Active Power",
     xlab = "Global Active Power (Kilowatts)"
    )
## Copy plot to a PNG file
dev.copy(png, file = "plot1.png",width = 480, height = 480) 
dev.off()