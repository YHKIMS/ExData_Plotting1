#Create directory and unzip the zip file
if(!file.exists('./data')){dir.create('data')}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = './data/Assignment.zip')
unzip('./data/Assignment.zip',exdir = './data')

#Read the data
data<-read.table('./data/household_power_consumption.txt',na.strings = "?",sep=';',stringsAsFactors = F,header = T)
data<-data[data$Date%in%c('1/2/2007','2/2/2007'),]

#plot the histogram and copy it as 'plot1.png'
hist(data$Global_active_power,main='Global Active Power',col='red',xlab='Global Active Power(kilowatts)')
dev.copy(png,file='plot1.png')
dev.off()
