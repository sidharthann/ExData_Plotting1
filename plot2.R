library(readr)
library(dplyr)

data <- read_delim("household_power_consumption.txt", delim = ';', na = '?', col_types = c('ccnnnnnnn')) %>%
    mutate(Date = as.Date(Date, '%d/%m/%Y')) %>% 
    filter(Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02')) %>%
    mutate(Time = as.POSIXct(paste(as.character(Date, format = '%Y-%m-%d'), Time, sep = " "), format = '%Y-%m-%d %H:%M:%S'))

        

png(file = 'plot2.png', width = 480, height = 480, units = "px")

plot(data$Time, data$Global_active_power, type = 'n', xlab = '', ylab = 'Global Active Power (kilowatts)')
lines(data$Time, data$Global_active_power)
dev.off()