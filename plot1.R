# Read data
hpc <- subset(read.csv('household_power_consumption.txt', na.string="?", sep = ';', nrows = 2100000)
               , Date == '1/2/2007' | Date == '2/2/2007')

# Plot
hist(hpc$Global_active_power, col='red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')

# Write to png
dev.copy(png, filename='plot1.png', width=480, height=480)
dev.off()
