#Set working directory
setwd("~/Copy/Courses/CourseraDataScience/Course4_ExploratoryAnalysis/ExData_Plotting1")

#Read in data, defining column classes as character
classes <- rep("character",9)
hpc <- read.delim("../household_power_consumption.txt", colClasses = classes, sep = ";")

#Replace missing data with NAs
hpc[hpc == "?"] <- NA

#Convert Date column to date formant
hpc[,1] <- as.Date(hpc[,1], format="%d/%m/%Y")

#Convert columns 3:9 to numeric
hpc[,3:9] <- apply(hpc[,3:9],2,as.numeric)

#Subset date based on date
hpc.dates <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

#Plot 4
png("plot4.png", width = 480, height = 480)
layout(matrix(1:4, ncol=2))
plot(hpc.dates$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", xaxt = "n")
axis(1, at = c(0, nrow(hpc.dates)/2, nrow(hpc.dates)), labels = c("Thu", "Fri", "Sat"))
plot(hpc.dates$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", xaxt = "n")
axis(1, at = c(0, nrow(hpc.dates)/2, nrow(hpc.dates)), labels = c("Thu", "Fri", "Sat"))
lines(hpc.dates$Sub_metering_2, type = "l", col = "red")
lines(hpc.dates$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty=c(1,1,1), bty = "n")
plot(hpc.dates$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(1, at = c(0, nrow(hpc.dates)/2, nrow(hpc.dates)), labels = c("Thu", "Fri", "Sat"))
plot(hpc.dates$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", xaxt = "n")
axis(1, at = c(0, nrow(hpc.dates)/2, nrow(hpc.dates)), labels = c("Thu", "Fri", "Sat"))
dev.off()

