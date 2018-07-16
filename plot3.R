#read in data
dt<-read.delim('../household_power_consumption.txt', sep = ';',header = T, na.strings = '?')
head(dt)
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
dt2<-dt[dt$Date==as.Date('2007-02-01','%Y-%m-%d')|
          dt$Date==as.Date('2007-02-02','%Y-%m-%d'),]
dt2$datetime<-paste(as.character(dt2$Date),as.character(dt2$Time))
dt2$datetime<-as.POSIXct(strptime(dt2$datetime,"%Y-%m-%d %H:%M:%S"))
head(dt2)

#plot3
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12)
plot(Sub_metering_1~as.POSIXct(datetime),data = dt2, type='l', col='black',
     ylab='Energy sub metering',xlab="")
lines(Sub_metering_2~as.POSIXct(datetime),data = dt2, type='l', col='red')
lines(Sub_metering_3~as.POSIXct(datetime),data = dt2, type='l', col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty=1, cex=.65)
dev.off()
