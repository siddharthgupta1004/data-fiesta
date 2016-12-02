mvt = read.csv("mvtWeek1.csv")
str(mvt)
summary(mvt)

mvt$Date[1]
DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))
summary(DateConvert)

mvt$Month = months(DateConvert)
mvt$Weekday = weekdays(DateConvert)
mvt$Date = DateConvert
table(mvt$Month)
table(mvt$Weekday)
table(mvt$Month, mvt$Arrest)

hist(mvt$Date, breaks = 100)
boxplot(mvt$Date ~ mvt$Arrest)

table(mvt$Year, mvt$Arrest)

sort(table(mvt$LocationDescription))

Top5 = subset(mvt, LocationDescription == "STREET" | LocationDescription == "PARKING LOT/GARAGE(NON.RESID.)" | LocationDescription == "ALLEY" | LocationDescription == "GAS STATION" | LocationDescription == "DRIVEWAY - RESIDENTIAL")
str(Top5)

Top5$LocationDescription = factor(Top5$LocationDescription)
table(Top5$LocationDescription, Top5$Arrest)

GasStation = subset(Top5, Top5$LocationDescription == "GAS STATION")
str(GasStation)
GasStation$LocationDescription = factor(GasStation$LocationDescription)
str(GasStation)
table(GasStation$Weekday)

table(Top5$LocationDescription, Top5$Weekday)