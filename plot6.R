pm25 <- readRDS("summarySCC_PM25.rds")
source1 <- readRDS("Source_Classification_Code.rds")
reqdata<-merge(pm25,source1,by.x = "SCC")
reqdata1<-pm25[pm25$fips %in% c("24510","06037") & pm25$type %in% "ON-ROAD",]
meancity <- aggregate(Emissions ~ year + fips, reqdata1, sum)
meancity$fips[meancity$fips=="24510"] <- "Baltimore"
meancity$fips[meancity$fips=="06037"] <- "Los Angeles"
png("plot6.png", width=1040, height=480)
g <- ggplot(meancity, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle in Baltimore City vs Los Angeles')
print(g)
dev.off()