plot4<-function(){
        pwrconsump <-read.table("household_power_consumption.txt", header=T, sep =";", stringsAsFactors=F, skip=66636, nrows=2880)
        names(pwrconsump)<-c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
                             "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )
        dsdt<-strptime(paste(pwrconsump$Date,pwrconsump$Time), "%d/%m/%Y %H:%M:%S")
        par(mfrow=c(2,2))
        
        plot(dsdt, pwrconsump$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        plot(dsdt, pwrconsump$Voltage, type="l", xlab="datetime", ylab="Voltage", col="black")
        plot(dsdt, pwrconsump$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
        lines(dsdt,pwrconsump$Sub_metering_2, col="red")
        lines(dsdt,pwrconsump$Sub_metering_3, col="blue")
        ## On Windows the legend displays fine, but when written to the png file, the right is cutoff.
        ## Added the text.width to resolve but it only move it in the display.
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=c(1,1), col=c("black","red","blue"),text.width=50000)
        plot(dsdt, pwrconsump$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", col="black")
        dev.copy(png, file="plot4.png")
        dev.off()
        par(mfrow=c(1,1))
}