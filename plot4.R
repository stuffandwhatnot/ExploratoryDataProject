
##PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data 
##frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008.
##For each year, the table contains number of tons of PM2.5 emitted from a 
##specific type of source for the entire year. 

##Question 4 
##Across the United States, how have emissions from coal combustion-
##related sources changed from 1999–2008?

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##ran these, it did take a while! 

##Plot 4 (took a while to figure out how to track down the "coal related" data here, plot of Level.Four showed it was mixed?)
Combustion <- grepl(pattern = "combust", x = SCC$SCC.Level.One,ignore.case = TRUE)
Coal <- grepl(pattern = "coal", x = SCC$SCC.Level.Four,ignore.case = TRUE)
AggregateCoal <- (Combustion & Coal)
CombustionSCC <- SCC[Combustion,]$SCC
CombustionNEI <- NEI[NEI$SCC %in% CombustionSCC,]

##Create a line graph showing change in coal 
png(filename = "plot4.png", width = 480, height = 480) 
graphdata <- ddply(CombustionNEI, .(year), numcolwise(sum))
FinalGraph <- ggplot(graphdata) + aes(x = factor(year), y = Emissions, group = 1) + geom_line() + labs(x="Year", y="Total PM2.5") + labs(title="PM2.5 Coal Source Emissions")
print(FinalGraph)
dev.off()
