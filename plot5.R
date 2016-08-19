pm25 <- readRDS("summarySCC_PM25.rds")
source1 <- readRDS("Source_Classification_Code.rds")
reqdata<-merge(pm25,source1,by.x = "SCC")
reqdata1<-pm25[pm25$fips %in% "24510" & pm25$type %in% "ON-ROAD",]
meanyear<-aggregate(Emissions ~ year, reqdata1, sum)
png("plot5.png", width=640, height=480)
library(ggplot2)
meanmotor <- aggregate(Emissions ~ year, meanyear, sum)
g <- ggplot(meanmotor, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle in Baltimore City from 1999 to 2008')
print(g)
dev.off()