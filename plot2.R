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
png("plot2.png",height=480, width=480)
with(housesub,plot(date_complete,Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

