#Create directory and unzip the zip file
if(!file.exists('./data')){dir.create('data')}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = './data/Assignment.zip')
unzip('./data/Assignment.zip',exdir = './data')

#Read the data
data<-read.table('./data/household_power_consumption.txt',na.strings = "?",sep=';',stringsAsFactors = F,header = T)
data<-data[data$Date%in%c('1/2/2007','2/2/2007'),]

#Plot the graph and save it as 'plot3.png'
plot(data$DateTime,data$Sub_metering_1,col='black',type='l',xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col='red',type='s')
lines(data$DateTime,data$Sub_metering_3,col='blue',type='s')
legend('topright',col=c('black','red','blue'),legend =c('sub metering_1','sub_metering_2','sub_metering_3'),lty=c(1,1,1))
dev.copy(png,file='plot3.png')
dev.off()
