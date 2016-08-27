library(readr)
library(dplyr)

data <- read_delim("household_power_consumption.txt", delim = ';', na = '?', col_types = c('ccnnnnnnn')) %>%
    mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
    filter(Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02')) %>%
    mutate(Time = as.POSIXct(paste(as.character(Date, format = '%Y-%m-%d'), Time, sep = " "), format = '%Y-%m-%d %H:%M:%S'))



png(file = 'plot4.png', width = 480, height = 480, units = "px")

par(mfcol = c(2,2), mar = c(4,4,1,1))

plot(data$Time, data$Global_active_power, type = 'n', xlab = '', ylab = 'Global Active Power')
lines(data$Time, data$Global_active_power)

plot(data$Time, data$Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering')
lines(data$Time, data$Sub_metering_1, col = 'black', type = 'l', lwd = 1)
lines(data$Time, data$Sub_metering_2, col = 'red', type = 'l', lwd = 1)
lines(data$Time, data$Sub_metering_3, col = 'blue', type = 'l', lwd = 1)
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lwd = c(1, 1, 1))

plot(data$Time, data$Voltage, type = 'n', xlab = 'datetime', ylab = 'Voltage')
lines(data$Time, data$Voltage)

plot(data$Time, data$Global_reactive_power, type = 'n', xlab = 'datetime', ylab = 'Global_reactive_power')
lines(data$Time, data$Global_reactive_power)

dev.off()