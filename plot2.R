
##PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data 
##frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008.
##For each year, the table contains number of tons of PM2.5 emitted from a 
##specific type of source for the entire year. 

##Question 2 
##Have total emissions from PM2.5 decreased in the Baltimore City, 
##Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
##system to make a plot answering this question.

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##ran these, it did take a while! 

##Plot 2
BaltimoreNEI <- (NEI[NEI$fips == 24510,])
AggregateBaltimoreData <- aggregate(Emissions ~ year, data = BaltimoreNEI, FUN = sum)

##Create a bar plot, looks better than just line plot for this
png(filename = "plot2.png", width = 480, height = 480) 
barplot(AggregateBaltimoreData$Emissions, names.arg = AggregateBaltimoreData$year, col = "red", xlab = "Year", ylab = "PM2.5 Emissions", main = "PM2.5 in aggregate for Baltimore by year")
dev.off() 
