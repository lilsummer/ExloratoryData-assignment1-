###Plot 1
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


##plot 2
		###open png device
		png(filename="plot2.png",width=480,height=480)
		
		##plot
		with(Data3, plot(Global_active_power, type="l",xaxt='n',ylab="Global Active Power (kilowatts)",xlab=""))
		
		##add x-axis tick label
		axis(1, at=c(1,nrow(Data3)/2,nrow(Data3)),labels=c("Thu","Fri","Sat"))
		
		##turn off device
		dev.off()
