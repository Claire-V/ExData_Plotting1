## Comment the lines in this section after the data has been loaded once, so as not to lose time reloading the whole dataset for every graph  
myFile <- "household_power_consumption.txt"
myData <- read.csv(myFile,stringsAsFactors=FALSE, sep=";",colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = c("NA","?"))
myData$Date <- as.Date(myData$Date,format='%d/%m/%Y')
Data <-subset(myData, myData$Date == as.Date("01/02/2007",format='%d/%m/%Y') | myData$Date == as.Date("02/02/2007",format='%d/%m/%Y'))
## End of comment section


png(filename="plot3.png", 
    width = 480, height = 480, units = "px")
par(mai=c(0.8,1.0,0.8,0.5))
dates<-c(Data$Date)
times<-c(Data$Time)
fulldates<-paste(dates,times)
xaxisvalues<-strptime(fulldates,format="%Y-%m-%d %H:%M:%S")

with(Data,plot(xaxisvalues,Data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
lines(xaxisvalues,Data$Sub_metering_1,col="black")
lines(xaxisvalues,Data$Sub_metering_2,col="red")
lines(xaxisvalues,Data$Sub_metering_3,col="blue")
legend("topright",lwd = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()