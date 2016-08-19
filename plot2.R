pm25 <- readRDS("summarySCC_PM25.rds")
reqdata<-pm25[pm25$fips %in% "24510",]
meanyear<-(tapply(reqdata$Emissions,reqdata$year,sum))
png("plot2.png", width=480, height=480)
barplot(meanyear,xlab = "years",ylab="emmsions in baltimore city")
dev.off()