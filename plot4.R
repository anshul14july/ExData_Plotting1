mydata <- read.csv(file.choose(),header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subset <- subset(mydata,Date %in%  c("1/2/2007","2/2/2007"))
subset$Date <- as.Date(subset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subset$Date), subset$Time)
subset$Datetime <- as.POSIXct(datetime)
par(mfrow = c(2,2))
with(subset, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")})
with(subset, {
  plot(Voltage~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")})
with(subset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(subset, {
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")})
