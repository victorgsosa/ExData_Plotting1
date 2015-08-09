source("read.electric.data.R")
electric.data <- read.electric.data()
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), oma = c (3, 2, 0, 0))
# Plot 1: Global active power vs Datetime
with(electric.data, {
    plot(Datetime, Global_active_power, type="l", xaxt = "n", ylab = "", xlab = "")
    at <- seq(1, length(Datetime), 1440)
    axis(1, Datetime[at], labels=format(Datetime[at], "%a"))
    title(ylab = "Global Active Power (kilowatts)")
})
# Plot 2: Voltage vs Datetime
with(electric.data, {
    plot(Datetime, Voltage, type="l", xaxt = "n", ylab = "Voltage")
    at <- seq(1, length(Datetime), 1440)
    axis(1, Datetime[at], labels=format(Datetime[at], "%a"))
})
# Plot 3: Energy Sub metering
with(electric.data, {
    plot(Datetime, Sub_metering_1, type="l", xaxt = "n", col = "black", ylab = "", xlab = "")
    points(Datetime, Sub_metering_2, type="l", xaxt = "n", col = "red")
    points(Datetime, Sub_metering_3, type="l", xaxt = "n", col = "blue")
    at <- seq(1, length(Datetime), 1440)
    axis(1, Datetime[at], labels=format(Datetime[at], "%a"))
    title(ylab = "Energy sub metering")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), lty = 1, bty = "n", cex = .75)
})
# Plot 4: Global reactive power vs Datetime
with(electric.data, {
    plot(Datetime, Global_reactive_power, type="l", xaxt = "n")
    at <- seq(1, length(Datetime), 1440)
    axis(1, Datetime[at], labels=format(Datetime[at], "%a"))
})
dev.off()
