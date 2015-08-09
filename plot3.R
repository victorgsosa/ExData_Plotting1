source("read.electric.data.R")
electric.data <- read.electric.data()
png(filename = "plot3.png", width = 480, height = 480)
with(electric.data, {
    plot(Datetime, Sub_metering_1, type="l", xaxt = "n", col = "black", ylab = "", xlab = "")
    points(Datetime, Sub_metering_2, type="l", xaxt = "n", col = "red")
    points(Datetime, Sub_metering_3, type="l", xaxt = "n", col = "blue")
    at <- seq(1, length(Datetime), 1440)
    axis(1, Datetime[at], labels=format(Datetime[at], "%a"))
    title(ylab = "Energy sub metering")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), lty = 1)
})
dev.off()