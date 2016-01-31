
##PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data 
##frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008.
##For each year, the table contains number of tons of PM2.5 emitted from a 
##specific type of source for the entire year. 

##Question 5 
##How have emissions from motor vehicle sources changed from 
##1999–2008 in Baltimore City?

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##ran these, it did take a while! 

##Plot 5
MotorVehicles <- grepl(pattern = "vehicle", x = SCC$SCC.Level.Two, ignore.case = TRUE)
VehicleSCC <- SCC[MotorVehicles,]$SCC
VehicleNEI <- NEI[NEI$SCC %in% VehicleSCC,]

BaltimoreVehiclesNEI <- (VehicleNEI[VehicleNEI$fips == "24510",])

##Create a line graph showing change in coal 
png(filename = "plot5.png", width = 480, height = 480) 
graphdata <- ddply(BaltimoreVehiclesNEI, .(year), numcolwise(sum))
FinalGraph <- ggplot(graphdata) + aes(x = factor(year), y = Emissions, group = 1) + geom_line() + labs(x="Year", y="Total PM2.5") + labs(title="PM2.5 Vehicle Source Emissions")
print(FinalGraph)
dev.off()

