# plot1.R 
# author: Ted M
# date: Sep 11, 2016
# title: Coursera Exploratory Data Analysis Week 4 exercise, plot 1
# function: display a histogram of household global minute-averaged active power consumption for the period 2/1/2007-2/2/2007
# notes: this script uses the "Electric power sonumption" dataset from UC Irvine Machine Learning Repository
# we use the "readr" library - as it's less memory-intensive than the base read functions
library(readr)
library(lubridate)

# read the dataset, and interpret the question mark as an NA value
hpc <-read_delim("household_power_consumption.txt",";",na=c("?"))

# interpret the date column properly
hpc$Date<-as.Date(hpc$Date, "%d/%m/%Y")

# get the subset for the desired date range
hpc_sub<-subset(hpc,hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02") )

# plot the histogram, with colors and labels as specified in the exercise
# note: to test, comment out the png and dev.off statements
png(filename = "plot1.png", width = 480, height = 480)
hist(hpc_sub$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power")
dev.off()
print("Done!")