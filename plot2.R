#read in data
dt<-read.delim('../household_power_consumption.txt', sep = ';',header = T, na.strings = '?')
head(dt)
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
dt2<-dt[dt$Date==as.Date('2007-02-01','%Y-%m-%d')|
          dt$Date==as.Date('2007-02-02','%Y-%m-%d'),]
dt2$datetime<-paste(as.character(dt2$Date),as.character(dt2$Time))
dt2$datetime<-strptime(dt2$datetime,"%Y-%m-%d %H:%M:%S")

#plot2
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)
plot(Global_active_power~as.POSIXct(datetime),data = dt2, type='l',
     ylab='Global Active Power (kilowatts)',xlab='')
#axis(side=1, at=dt2$Time['00:00:00'], labels=c('Thu','Fri','Sat'))
dev.off()
