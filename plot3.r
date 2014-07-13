##read data
list=read.csv('household.txt',nrow=80000,header=T,sep=";",na.strings="?")


###change time
list$Time=strptime(list$Time,format="%H:%M:%S")

###change date
list$Date=as.Date(list$Date,format="%d/%m/%Y")


###subset the data by speficying the date
idxData1=which(list$Date=="2007-02-01")
Data1=list[idxData1,]

idxData2=which(list$Date=="2007-02-02")
Data2=list[idxData2,]


Data3=rbind(Data1,Data2)

##plot 3
		###open png device
		png(filename="plot3.png",width=480,height=480)
		
		##plot
		plot(Data3$Sub_metering_1,col='black',type='l',xlab='',ylab='Energy sub metering',xaxt='n')
		lines(Data3$Sub_metering_2,col='red')
		lines(Data3$Sub_metering_3,col='blue')
		
		#legend
		legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
		
		##add x-axis tick label
		axis(1, at=c(1,nrow(Data3)/2,nrow(Data3)),labels=c("Thu","Fri","Sat"))
		
		##turn off device
		dev.off()
		
