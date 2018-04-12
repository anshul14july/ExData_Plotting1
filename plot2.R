
mydata <- read.csv(file.choose(),header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subset <- subset(mydata,Date %in%  c("1/2/2007","2/2/2007"))
subset$Date <- as.Date(subset$Date, format="%d/%m/%Y")
str(subset)
datetime <- paste(as.Date(subset$Date), subset$Time)
subset$Datetime <- as.POSIXct(datetime)
head(subset)
with(subset, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
