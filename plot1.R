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

#Plot 1
png("plot1.png", width = 480, height = 480)
hist(hpc.dates$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()

