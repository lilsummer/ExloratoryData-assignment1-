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
		
			###open png device
			png(filename="plot1.png",width=480,height=480)
		
			##plot the hist
			with(Data3,hist(Data3$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col='red'))
			
			##turn off device
			dev.off()
			
