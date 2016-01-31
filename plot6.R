
##PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data 
##frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008.
##For each year, the table contains number of tons of PM2.5 emitted from a 
##specific type of source for the entire year. 

##Question 6
##Compare emissions from motor vehicle sources in Baltimore City with 
##emissions from motor vehicle sources in Los Angeles County, 
##California (fips == "06037"). Which city has seen greater changes 
##over time in motor vehicle emissions?

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##ran these, it did take a while! 

##Plot 6
MotorVehicles <- grepl(pattern = "vehicle", x = SCC$SCC.Level.Two, ignore.case = TRUE)
VehicleSCC <- SCC[MotorVehicles,]$SCC
VehicleNEI <- NEI[NEI$SCC %in% VehicleSCC,]
##vehicles only in Baltimore and LA
VehiclesLANEI <- VehicleNEI[VehicleNEI$fips=="06037",]
VehiclesLANEI$city <- "Los Angeles"
VehiclesBaltimoreNEI <- VehicleNEI[VehicleNEI$fips=="24510",]
VehiclesBaltimoreNEI$city <- "Baltimore"
SubsetVehicles <- rbind(VehiclesLANEI, VehiclesBaltimoreNEI)

##Create a graph to show differences between Baltimore and LA 
png(filename = "plot6.png", width = 480, height = 480) 
graphdata <- ddply(SubsetVehicles, .(year, city), numcolwise(sum))
FinalGraph <- ggplot(graphdata) + aes(x = factor(year), y = Emissions, group = factor(city), color = factor(city)) + geom_line() + labs(x="Year", y="Total PM2.5", color = "city") + labs(title="PM2.5 Vehicle Source Emissions")
print(FinalGraph)
dev.off()

