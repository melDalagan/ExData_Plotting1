## plot1 is a function with an argument as the file or the file path
## argument x is the unzip file household_power_consumption.txt

plot1 <- function(x)
{

## setting the working directory for execution on local computer - could be removed from the code
setwd("~/R/EXPLORATORY DATA PROJ DATA SET")

# Read data set 
hhpc <- read.delim(x,header=TRUE, sep=";")

# Household power consumption for Feb. 1 and 2, 2007 only
hhpc2 <- hhpc[as.character(hhpc$Date) %in% c("1/2/2007", "2/2/2007"),]

# Concatante Date and Time variables
hhpc2$dateTime = paste(hhpc2$Date, hhpc2$Time)

# Convert to Date/Time class
hhpc2$dateTime <- strptime(hhpc2$dateTime, "%d/%m/%Y %H:%M:%S")
attach(hhpc2)

png("plot1.png", width=480, height=480, units="px")

# Plot the distribution of global active power
hist(as.numeric(as.character(Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

}