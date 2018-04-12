install.packages("sqldf")
library(sqldf)
mydata <- read.csv(file.choose(),header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
?read.delim
head(mydata)
str(mydata) 
mydata$Date <- as.Date(mydata$Date,format = "%d/%m/%Y")
str(mydata)
?strptime
subset <- subset(mydata,Date %in%  c("1/2/2007","2/2/2007"))
head(subset)
hist(subset$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main = "Global Active Power")
