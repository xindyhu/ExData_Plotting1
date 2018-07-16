#read in data
dt<-read.delim('../household_power_consumption.txt', sep = ';',header = T, na.strings = '?')
head(dt)
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
dt2<-dt[dt$Date==as.Date('2007-02-01','%Y-%m-%d')|
          dt$Date==as.Date('2007-02-02','%Y-%m-%d'),]
#plot1
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)
hist(dt2$Global_active_power,breaks = 12,col = 'red',
     main='Global Active Power', xlab='Global Active Power (kilowatts)',
     ylab='Frequency')
dev.off()
