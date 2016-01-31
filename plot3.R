
##PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data 
##frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008.
##For each year, the table contains number of tons of PM2.5 emitted from a 
##specific type of source for the entire year. 

##Question 2 
##Of the four types of sources indicated by the type (point, nonpoint, 
##onroad, nonroad) variable, which of these four sources have seen 
##decreases in emissions from 1999–2008 for Baltimore City? Which have 
##seen increases in emissions from 1999–2008? Use the ggplot2 plotting 
##system to make a plot answer this question.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##ran these, it did take a while! 

##Plot 3 
BaltimoreNEI <- (NEI[NEI$fips == 24510,])

##Create a line chart with multiple lines (tried multi-panel bar chart?) 
png(filename = "plot3.png", width = 480, height = 480) 
GraphData <- ddply(BaltimoreNEI, .(year, type), numcolwise(sum))
FinalGraph <- ggplot(GraphData) + aes(x = factor(year), y = Emissions, group = type, col = type) + geom_path() + geom_point() + labs(title = "Emissions of PM2.5 in Baltimore", x = "Year", y = "Total PM2.5")
print(FinalGraph)
dev.off() 
