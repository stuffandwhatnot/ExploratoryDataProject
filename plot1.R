
## For each plot you should

## Construct the plot and save it to a PNG file.
## Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, 
## i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot 
## can be fully reproduced. You must also include the code that creates the PNG file. Only include the code for a single plot 
## (i.e. plot1.R should only include code for producing plot1.png)
## Upload the PNG file on the Assignment submission page
## Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assessment.

## Question 1

## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot 
## showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

##PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data 
##frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008.
##For each year, the table contains number of tons of PM2.5 emitted from a 
##specific type of source for the entire year. 


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##ran these, it did take a while! 

##Plot 1 
AggregateYearlyData <- aggregate(Emissions ~ year, data = NEI, FUN = sum)

##Create a bar plot, looks better than just line plot for this
png(filename = "Plot1.png", width = 480, height = 480)
barplot(AggregateYearlyData$Emissions, names.arg = AggregateYearlyData$year, col = "red", xlab = "Year", ylab = "PM2.5 Emissions", main = "PM2.5 in aggregate by year")
dev.off()
