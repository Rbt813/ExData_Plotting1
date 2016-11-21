## We are still using the firs line of code of previous plots to create the data frame with the observations of
## interest.

## Reading the data: 
household<-read.table("household_power_consumption.txt", sep=";",header=TRUE,stringsAsFactors = FALSE, na.strings = ?)

## head(household) 
## converting the text string in "Date" column to date format
household$Date<-as.Date(household$Date,format="%d/%m/%Y")

## Subsetting the data so that the data.frame easier to handle
housesub<-subset(household,household$Date>="2007-02-01" & household$Date<="2007-02-02")

## Removing the complete data frame and leaving only 'housesub'
rm(household)

## Converting 'Time' variable to POSIXct
## First, we need to create an additional variable
date_complete<-paste(housesub$Date, housesub$Time)
date_complete<-as.POSIXct(date_complete, format="%Y-%m-%d %H:%M:%S")
date_complete<-as.data.frame(date_complete)
housesub<-cbind(housesub,date_complete)

## Creating the four graphs
## First, we need to change the parameters
png("plot4.png",height=480,width = 480)
par(mfrow=c(2,2),mar=c(4,4,3,2),oma=c(2,2,2,2))

## Graph 1
with(housesub,plot(date_complete,Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts"))

## Graph 2
with(housesub,plot(date_complete,Voltage,type="l",xlab="datetime", ylab="Voltage"))

## Graph 3
with(housesub,plot(Sub_metering_1~date_complete, type="l",ylab="Energy sub metering",xlab=""))
legend("topright",col=c("black", "red", "blue"), legend=names(housesub[,7:9]),lty=1, bty="n",cex=0.9) 
## cex=0.9 reduces text size by 10%
## bty="n" removes the border of the legend 
with(housesub,lines(Sub_metering_2~date_complete, col="red"))
with(housesub,lines(Sub_metering_3~date_complete, col="blue"))

## Graph 4
with(housesub,plot(date_complete,Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power"))

dev.off()