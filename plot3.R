plot3<-function(){
        pwrconsump <-read.table("household_power_consumption.txt", header=T, sep =";", stringsAsFactors=F, skip=66636, nrows=2880)
        names(pwrconsump)<-c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
                     "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )
        dsdt<-strptime(paste(pwrconsump$Date,pwrconsump$Time), "%d/%m/%Y %H:%M:%S")
        plot(dsdt, pwrconsump$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
        lines(dsdt,pwrconsump$Sub_metering_2, col="red")
        lines(dsdt,pwrconsump$Sub_metering_3, col="blue")
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"))
        dev.copy(png, file="plot3.png")
        dev.off()
}