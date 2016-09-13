# plot3.R 
# author: Ted M
# date: Sep 11, 2016
# title: Coursera Exploratory Data Analysis Week 4 exercise, plot 1
# function: display a plot of energy sub-metering for the period 2/1/2007-2/2/2007
# notes: this script uses the "Electric power consumption" dataset from UC Irvine Machine Learning Repository
# we use the "readr" library - as it's less memory-intensive than the base read functions
library(readr)
library(lubridate)

# read the dataset, read the date and time as strings and interpret the question mark as an NA value, and remaining cols as double
hpc <-read_delim("household_power_consumption.txt",";",na=c("?"),
                 col_types = cols(col_date("%d/%m/%Y"), 
                                  col_time("%H:%M:%S"), 
                                  col_double(),
                                  col_double(),
                                  col_double(),
                                  col_double(),
                                  col_double(),
                                  col_double(),
                                  col_double()))

# get the subset for the desired date range
hpc_sub<-subset(hpc,hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02") )

# combine the date and time columns into a timestamp
hpc_sub$Timestamp <- hpc_sub$Date + seconds(hpc_sub$Time)

# plot the histogram, with colors and labels as specified in the exercise
# note: to test, comment out the png and dev.off statements
png(filename = "plot3.png", width = 480, height = 480)
plot(hpc_sub$Timestamp, hpc_sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc_sub$Timestamp, hpc_sub$Sub_metering_2, col="red")
lines(hpc_sub$Timestamp, hpc_sub$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()
print("Done!")