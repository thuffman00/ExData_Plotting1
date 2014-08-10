plot1<-function(){
        pwrconsump <-read.table("household_power_consumption.txt", header=T, sep =";", stringsAsFactors=F, skip=66636, nrows=2880)
        names(pwrconsump)<-c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
                             "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )
        hist(as.numeric(pwrconsump$Global_active_power), col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.copy(png, file="plot1.png")
        dev.off()
}