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

#Plot 2
png("plot2.png", width = 480, height = 480)
plot(hpc.dates$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")
axis(1, at = c(0, nrow(hpc.dates)/2, nrow(hpc.dates)), labels = c("Thu", "Fri", "Sat"))
dev.off()
