## The information is contained in a .txt file separated by ";" and has column names, so in order to read it: 
household<-read.table("household_power_consumption.txt", sep=";",header=TRUE,stringsAsFactors = FALSE)

## head(household) 
household$Date<-as.Date(household$Date,format="%d/%m/%Y", na.strings="?")

## converting the text string in "Date" column to date format
household$Date<-as.Date(household$Date,format="%d/%m/%Y")

## Subsetting the data so that the data.frame easier to handle
housesub<-subset(household,household$Date>="2007-02-01" & household$Date<="2007-02-02")

## Removing the complete data frame and leaving only 'housesub'
rm(household)

## Converting values to numeric
housesub[,3:9]<-sapply(housesub[,3:9],as.numeric)

## Creating the histogram
png("plot1.png", height=480, width=480)
hist(housesub$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts")
dev.off()