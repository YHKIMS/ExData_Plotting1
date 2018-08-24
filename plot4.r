#Create directory and unzip the zip file
if(!file.exists('./data')){dir.create('data')}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = './data/Assignment.zip')
unzip('./data/Assignment.zip',exdir = './data')

#Read the data
data<-read.table('./data/household_power_consumption.txt',na.strings = "?",sep=';',stringsAsFactors = F,header = T)
data<-data[data$Date%in%c('1/2/2007','2/2/2007'),]

#plot the graph and save it as 'plot4.png'
par(mfrow=c(2,2))
plot(data$DateTime,data$Global_active_power,type='l',lwd=2,xlab="",ylab='Global Active Power')
plot(data$DateTime,data$Voltage,xlab='datetime',type='l',lwd=2,ylab = 'Voltage')
plot(data$DateTime,data$Sub_metering_1,col='black',type='l',xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col='red',type='s')
lines(data$DateTime,data$Sub_metering_3,col='blue',type='s')
legend('topright',col=c('black','red','blue'),legend =c('sub metering_1','sub_metering_2','sub_metering_3'),lty=c(1,1,1),cex=0.7)
plot(data$DateTime,data$Global_reactive_power,type='l',ylim=c(0,0.5),xlab='datetime',ylab='Global_reactive_power')
dev.copy(png,file='plot4.png')
dev.off()

