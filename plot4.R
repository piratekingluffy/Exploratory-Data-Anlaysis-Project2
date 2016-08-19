pm25 <- readRDS("summarySCC_PM25.rds")
source1 <- readRDS("Source_Classification_Code.rds")
reqdata<-merge(pm25,source1,by.x = "SCC")
reqdata1<-reqdata[grepl("coal",reqdata$Short.Name,ignore.case=TRUE),]
meanyear<-aggregate(Emissions ~ year, reqdata1, sum)
png("plot4.png", width=480, height=480)
library(ggplot2)
g<-ggplot(meanyear,aes(factor(year),Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()