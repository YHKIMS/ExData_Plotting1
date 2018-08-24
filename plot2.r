#Create directory and unzip the zip file
if(!file.exists('./data')){dir.create('data')}
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = './data/Assignment.zip')
unzip('./data/Assignment.zip',exdir = './data')

#Read the data
data<-read.table('./data/household_power_consumption.txt',na.strings = "?",sep=';',stringsAsFactors = F,header = T)
data<-data[data$Date%in%c('1/2/2007','2/2/2007'),]

#create the x-axis of the graph(usin as.Date(), and strp() function)
data$Date<-as.Date(data$Date,format = '%d/%m/%Y')
data$DateTime<-paste(data$Date,data$Time)
data$DateTime<-strptime(data$DateTime,format = '%Y-%m-%d %H:%M:%S')

#plot the graph and copy it as 'plot2.png'
plot(data$DateTime,data$Global_active_power,type='l',lwd=2,ylab='Global Active Power(kilowatts)',xlab = "")
dev.copy(png,file='plot2.png')
dev.off()
