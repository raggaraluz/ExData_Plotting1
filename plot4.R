  # Read data
  hpc <- subset(read.csv('household_power_consumption.txt', na.string="?", sep = ';', nrows = 2100000)
                , Date == '1/2/2007' | Date == '2/2/2007')
  hpc$timestamp <- with(hpc, strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S'))

  png(filename='plot4.png', width=480, height=480)
  
  # Create plot
  par(mfrow=c(2,2))
  
  ## 1,1
  with(hpc, plot(timestamp, Global_active_power, ylab='Global Active Power', xlab='', type = 'n'))
  with(hpc, lines(timestamp, Global_active_power))
  
  ## 1,2
  with(hpc, plot(timestamp, Voltage, ylab='Voltage', xlab='datetime', type = 'n'))
  with(hpc, lines(timestamp, Voltage))
  
  ## 2,1
  with(hpc, plot(timestamp, Sub_metering_1, ylab='Energy sub metering', xlab='', type = 'n'))
  with(hpc, lines(timestamp, Sub_metering_1, col='black'))
  with(hpc, lines(timestamp, Sub_metering_2, col='red'))
  with(hpc, lines(timestamp, Sub_metering_3, col='blue'))
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
          col = c('black', 'red', 'blue'), lwd=1, bty="n")
  
  ## 2,2
  with(hpc, plot(timestamp, Global_reactive_power, xlab='datetime', type='n'))
  with(hpc, lines(timestamp, Global_reactive_power))

  # Write to png
  dev.off()
