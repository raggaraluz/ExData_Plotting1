# Read data
hpc <- subset(read.csv('household_power_consumption.txt', na.string="?", sep = ';', nrows = 2100000)
              , Date == '1/2/2007' | Date == '2/2/2007')
hpc$timestamp <- with(hpc, strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S'))

# Create plot
with(hpc, plot(timestamp, Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type = 'n'))
with(hpc, lines(timestamp, Global_active_power))

# Write to png
dev.copy(png, filename='plot2.png', width=480, height=480)
dev.off()
