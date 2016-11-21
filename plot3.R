## Since for 'plot 3' we are gonna be needing basically the same information as with previous 'plot1' and 'plot2' files
## it makes sense to use the first commands

## Since the same informations is going to be used for 'plot2', to create the second plot, we also need to load the
## data
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

## Creating the graph
png("plot3.png",height=480, width=480)
with(housesub,plot(Sub_metering_1~date_complete, type="l",ylab="Energy sub metering",xlab=""))
legend("topright",col=c("black", "red", "blue"), legend=names(housesub[,7:9]),lty=1)
with(housesub,lines(Sub_metering_2~date_complete, col="red"))
with(housesub,lines(Sub_metering_3~date_complete, col="blue"))
dev.off()

