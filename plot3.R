pm25 <- readRDS("summarySCC_PM25.rds")
reqdata<-pm25[pm25$fips %in% "24510",]
meantype <- aggregate(Emissions ~ year + type, reqdata, sum)
png("plot3.png", width=640, height=480)
g <- ggplot(meantype, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()