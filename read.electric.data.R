read.electric.data <- function(){
    rawData <- read.csv("data/household_power_consumption.txt", sep=";", na.strings = "?", 
                        colClasses = c("character", "character", "numeric", "numeric", "numeric","numeric","numeric","numeric","numeric"))
    rawData <- transform(rawData, 
                         Datetime = strptime(paste(rawData$Date, rawData$Time), "%d/%m/%Y  %H:%M:%S"),
                         Date = as.Date(Date, format = "%d/%m/%Y" ))
    rawData <- subset(rawData, Datetime >= "2007-02-01" & Datetime <= "2007-02-03")
    rawData
}