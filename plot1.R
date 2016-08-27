library(readr)
library(dplyr)

data <- read_delim("household_power_consumption.txt", delim = ';', na = '?', col_types = c('ccnnnnnnn')) %>%
    mutate(Date = as.Date(Date, '%d/%m/%Y')) %>% 
    filter(Date >= as.Date('2007-02-01') & Date <= as.Date('2007-02-02')) %>%
    mutate(Time = as.POSIXct(Time, format = '%H:%M:%S'))

png(file = 'plot1.png', width = 480, height = 480, units = "px")

with(data, hist(Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power'))
dev.off()