library(tidyverse)
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
library(data.table)
library(plotly)
library(kableExtra)
library(rgdal)
library(rgeos)
library(sp)

path<-"C:/Users/tobbi/Desktop/Tube_London_Metro/multi-year-station-entry-and-exit-figures incl 2017.xlsx"


#évolution des entrées de métro de 2009 à 2017 /stations

#Note du fichier
mysefNote<-read_xlsx(path, sheet = 1)


#Year 2017
mysef2017<-read_xlsx(path, sheet = 2, skip = 6, n_max = 268)
#Renaming columns
names(mysef2017)[1]<-"nlc"
names(mysef2017)[2]<-"Station"
names(mysef2017)[3]<-"Borough"
names(mysef2017)[4]<-"Note"
names(mysef2017)[5]<-"Weekday_Entry"
names(mysef2017)[6]<-"Saturday_Entry"
names(mysef2017)[7]<-"Sunday_Entry"
names(mysef2017)[8]<-"Weekday_Exit"
names(mysef2017)[9]<-"Saturday_Exit"
names(mysef2017)[10]<-"Sunday_Exit"
names(mysef2017)[11]<-"Annual_Entry_Exit_million"
#Adding New column Year
Year<-2017
mysef2017<-cbind(mysef2017, Year)


#Year 2016
mysef2016<-read_xlsx(path, sheet = 3, skip=6, n_max=268)
#Renaming columns
names(mysef2016)[1]<-"nlc"
names(mysef2016)[2]<-"Station"
names(mysef2016)[3]<-"Borough"
names(mysef2016)[4]<-"Note"
names(mysef2016)[5]<-"Weekday_Entry"
names(mysef2016)[6]<-"Saturday_Entry"
names(mysef2016)[7]<-"Sunday_Entry"
names(mysef2016)[8]<-"Weekday_Exit"
names(mysef2016)[9]<-"Saturday_Exit"
names(mysef2016)[10]<-"Sunday_Exit"
names(mysef2016)[11]<-"Annual_Entry_Exit_million"
#Adding New column Year
Year1<-2016
mysef2016<-cbind(mysef2016, Year1)
names(mysef2016)[12]<-"Year"


#Year 2015
mysef2015<-read_xlsx(path, sheet = 4, skip=6)
#Renaming columns
names(mysef2015)[1]<-"nlc"
names(mysef2015)[2]<-"Station"
names(mysef2015)[3]<-"Borough"
names(mysef2015)[4]<-"Note"
names(mysef2015)[5]<-"Weekday_Entry"
names(mysef2015)[6]<-"Saturday_Entry"
names(mysef2015)[7]<-"Sunday_Entry"
names(mysef2015)[8]<-"Weekday_Exit"
names(mysef2015)[9]<-"Saturday_Exit"
names(mysef2015)[10]<-"Sunday_Exit"
names(mysef2015)[11]<-"Annual_Entry_Exit_million"
#Adding new columns Year
Year2<-2015
mysef2015<-cbind(mysef2015, Year2)
names(mysef2015)[12]<-"Year"



#Year 2014
mysef2014<-read_xlsx(path, sheet = 5, skip = 6, n_max = 268)
#Renaming columns
names(mysef2014)[1]<-"nlc"
names(mysef2014)[2]<-"Station"
names(mysef2014)[3]<-"Borough"
names(mysef2014)[4]<-"Note"
names(mysef2014)[5]<-"Weekday_Entry"
names(mysef2014)[6]<-"Saturday_Entry"
names(mysef2014)[7]<-"Sunday_Entry"
names(mysef2014)[8]<-"Weekday_Exit"
names(mysef2014)[9]<-"Saturday_Exit"
names(mysef2014)[10]<-"Sunday_Exit"
names(mysef2014)[11]<-"Annual_Entry_Exit_million"
#Adding New column Year
Year3<-2014
mysef2014<-cbind(mysef2014, Year3)
names(mysef2014)[12]<-"Year"


#Year 2013
mysef2013<-read_xlsx(path, sheet = 6, skip = 6, n_max = 268)
#Renaming columns
names(mysef2013)[1]<-"nlc"
names(mysef2013)[2]<-"Station"
names(mysef2013)[3]<-"Note"
names(mysef2013)[4]<-"Weekday_Entry"
names(mysef2013)[5]<-"Saturday_Entry"
names(mysef2013)[6]<-"Sunday_Entry"
names(mysef2013)[7]<-"Weekday_Exit"
names(mysef2013)[8]<-"Saturday_Exit"
names(mysef2013)[9]<-"Sunday_Exit"
names(mysef2013)[10]<-"Annual_Entry_Exit_million"
#Adding New column Year
Year4<-2013
mysef2013<-cbind(mysef2013, Year4)
names(mysef2013)[11]<-"Year"
mysef2013[,"Borough"] <- NA

#Year 2012
mysef2012<-read_xlsx(path, sheet = 7, skip = 6, n_max = 268)
#Renaming columns
names(mysef2012)[1]<-"nlc"
names(mysef2012)[2]<-"Station"
names(mysef2012)[3]<-"Note"
names(mysef2012)[4]<-"Weekday_Entry"
names(mysef2012)[5]<-"Saturday_Entry"
names(mysef2012)[6]<-"Sunday_Entry"
names(mysef2012)[7]<-"Weekday_Exit"
names(mysef2012)[8]<-"Saturday_Exit"
names(mysef2012)[9]<-"Sunday_Exit"
names(mysef2012)[10]<-"Annual_Entry_Exit_million"
#Adding new column Year
Year5<-2012
mysef2012<-cbind(mysef2012, Year5)
names(mysef2012)[11]<-"Year"
mysef2012[,"Borough"] <- NA

#Year 2011
mysef2011<-read_xlsx(path, sheet = 8, skip = 6, n_max = 268)
#Renaming columns
names(mysef2011)[1]<-"nlc"
names(mysef2011)[2]<-"Station"
names(mysef2011)[3]<-"Note"
names(mysef2011)[4]<-"Weekday_Entry"
names(mysef2011)[5]<-"Saturday_Entry"
names(mysef2011)[6]<-"Sunday_Entry"
names(mysef2011)[7]<-"Weekday_Exit"
names(mysef2011)[8]<-"Saturday_Exit"
names(mysef2011)[9]<-"Sunday_Exit"
names(mysef2011)[10]<-"Annual_Entry_Exit_million"
#Adding New column Year
Year6<-2011
mysef2011<-cbind(mysef2011, Year6)
names(mysef2011)[11]<-"Year"
mysef2011[,"Borough"] <- NA

#Year 2010
mysef2010<-read_xlsx(path, sheet = 10, skip = 6, n_max = 268)
#Renaming columns
names(mysef2010)[1]<-"nlc"
names(mysef2010)[2]<-"Station"
names(mysef2010)[3]<-"Note"
names(mysef2010)[4]<-"Weekday_Entry"
names(mysef2010)[5]<-"Saturday_Entry"
names(mysef2010)[6]<-"Sunday_Entry"
names(mysef2010)[7]<-"Weekday_Exit"
names(mysef2010)[8]<-"Saturday_Exit"
names(mysef2010)[9]<-"Sunday_Exit"
names(mysef2010)[10]<-"Annual_Entry_Exit_million"
#Adding New column Year
Year8<-2010
mysef2010<-cbind(mysef2010, Year8)
names(mysef2010)[11]<-"Year"
mysef2010[,"Borough"] <- NA

#Year 2009
mysef2009<-read_xlsx(path, sheet = 11, skip = 6, n_max = 268)
#Renaming columns
names(mysef2009)[1]<-"nlc"
names(mysef2009)[2]<-"Station"
names(mysef2009)[3]<-"Note"
names(mysef2009)[4]<-"Weekday_Entry"
names(mysef2009)[5]<-"Saturday_Entry"
names(mysef2009)[6]<-"Sunday_Entry"
names(mysef2009)[7]<-"Weekday_Exit"
names(mysef2009)[8]<-"Saturday_Exit"
names(mysef2009)[9]<-"Sunday_Exit"
names(mysef2009)[10]<-"Annual_Entry_Exit_million"
#Adding New column Year
Year9<-2009
mysef2009<-cbind(mysef2009, Year9)
names(mysef2009)[11]<-"Year"
mysef2009[,"Borough"] <- NA

# Year 2008
mysef2008<-read_xlsx(path, sheet = 12, skip = 6, n_max = 268)
#Renaming columns
names(mysef2008)[1]<-"nlc"
names(mysef2008)[2]<-"Station"
names(mysef2008)[3]<-"Note"
names(mysef2008)[4]<-"Weekday_Entry"
names(mysef2008)[5]<-"Saturday_Entry"
names(mysef2008)[6]<-"Sunday_Entry"
names(mysef2008)[7]<-"Weekday_Exit"
names(mysef2008)[8]<-"Saturday_Exit"
names(mysef2008)[9]<-"Sunday_Exit"
names(mysef2008)[10]<-"Annual_Entry_Exit_million"
#Adding New column Year
Year10<-2008
mysef2008<-cbind(mysef2008, Year10)
names(mysef2008)[11]<-"Year"
mysef2008[,"Borough"] <- NA

#Year 2007
mysef2007<-read_xlsx(path, sheet = 13, skip = 6, n_max = 268)
#Renaming columns
names(mysef2007)[1]<-"nlc"
names(mysef2007)[2]<-"Station"
names(mysef2007)[3]<-"Note"
names(mysef2007)[4]<-"Weekday_Entry"
names(mysef2007)[5]<-"Saturday_Entry"
names(mysef2007)[6]<-"Sunday_Entry"
names(mysef2007)[7]<-"Weekday_Exit"
names(mysef2007)[8]<-"Saturday_Exit"
names(mysef2007)[9]<-"Sunday_Exit"
names(mysef2007)[10]<-"Annual_Entry_Exit_million"
#Adding New column Year
Year11<-2007
mysef2007<-cbind(mysef2007, Year11)
names(mysef2007)[11]<-"Year"
mysef2007[,"Borough"] <- NA

station_borough <- mysef2017 %>%
  select("Station", "nlc", "Borough")

#merging all Year dataframe into one
usage_station_year<-merge(mysef2017, mysef2016, by = c("Station", "Borough", "nlc", "Weekday_Entry", "Saturday_Entry", "Sunday_Entry", "Weekday_Exit", "Saturday_Exit", "Sunday_Exit", "Note", "Annual_Entry_Exit_million", "Year"), all=TRUE)
usage_station_year<-merge(usage_station_year, mysef2015, by = c("Station", "Borough", "nlc", "Weekday_Entry", "Saturday_Entry", "Sunday_Entry", "Weekday_Exit", "Saturday_Exit", "Sunday_Exit", "Note", "Annual_Entry_Exit_million", "Year"), all =TRUE)
usage_station_year<-merge(usage_station_year, mysef2014, by = c("Station", "Borough", "nlc", "Weekday_Entry", "Saturday_Entry", "Sunday_Entry", "Weekday_Exit", "Saturday_Exit", "Sunday_Exit", "Note", "Annual_Entry_Exit_million", "Year"), all =TRUE)
usage_station_year<-merge(usage_station_year, mysef2013, by = c("Station", "Borough", "nlc", "Weekday_Entry", "Saturday_Entry", "Sunday_Entry", "Weekday_Exit", "Saturday_Exit", "Sunday_Exit", "Note", "Annual_Entry_Exit_million", "Year"), all.y =TRUE, all.x = TRUE)
usage_station_year<-merge(usage_station_year, mysef2012, by = c("Station", "Borough","nlc", "Weekday_Entry", "Saturday_Entry", "Sunday_Entry", "Weekday_Exit", "Saturday_Exit", "Sunday_Exit", "Note", "Annual_Entry_Exit_million", "Year"), all.y =TRUE, all.x=TRUE)
usage_station_year<-merge(usage_station_year, mysef2011, by = c("Station", "Borough","nlc", "Weekday_Entry", "Saturday_Entry", "Sunday_Entry", "Weekday_Exit", "Saturday_Exit", "Sunday_Exit", "Note", "Annual_Entry_Exit_million", "Year"), all.y=TRUE, all.x = TRUE)
usage_station_year<-merge(usage_station_year, mysef2010, by = c("Station", "Borough","nlc", "Weekday_Entry", "Saturday_Entry", "Sunday_Entry", "Weekday_Exit", "Saturday_Exit", "Sunday_Exit", "Note", "Annual_Entry_Exit_million", "Year"), all.y=TRUE, all.x = TRUE)
usage_station_year<-merge(usage_station_year, mysef2009, by = c("Station", "Borough","nlc", "Weekday_Entry", "Saturday_Entry", "Sunday_Entry", "Weekday_Exit", "Saturday_Exit", "Sunday_Exit", "Note", "Annual_Entry_Exit_million", "Year"), all.y=TRUE, all.x = TRUE)
usage_station_year<-merge(usage_station_year, mysef2008, by = c("Station", "Borough","nlc", "Weekday_Entry", "Saturday_Entry", "Sunday_Entry", "Weekday_Exit", "Saturday_Exit", "Sunday_Exit", "Note", "Annual_Entry_Exit_million", "Year"), all.y=TRUE, all.x = TRUE)
usage_station_year<-merge(usage_station_year, mysef2007, by = c("Station", "Borough","nlc", "Weekday_Entry", "Saturday_Entry", "Sunday_Entry", "Weekday_Exit", "Saturday_Exit", "Sunday_Exit", "Note", "Annual_Entry_Exit_million", "Year"), all.y=TRUE, all.x = TRUE)
usage_station_year<-merge(station_borough, usage_station_year, by = "nlc", all.y = TRUE, no.dups=TRUE, suffixes = c("", "_delete") )
#delete duplicates
usage_station_year<-usage_station_year %>%
  select(-c("Station_delete", "Borough_delete"))

#Structure of Usage Station Year
str(usage_station_year)
summary(usage_station_year)
#Year from num to chr
usage_station_year$Year<-as.character(usage_station_year$Year)

#Table best 10 Station 2017
top_ten_2017<-usage_station_year %>%
  filter(Year==2017) %>%
  group_by(Station)%>%
  select(Station, Annual_Entry_Exit_million)%>%
  arrange(desc(Annual_Entry_Exit_million))
kable(head(top_ten_2017, n=10))%>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

#Top ten Station with Highest Passenger by year
top_ten<-usage_station_year %>%
  group_by(Station)%>%
  filter(Annual_Entry_Exit_million>=75)%>%
  select(Station, Annual_Entry_Exit_million, Year)%>%
  arrange(desc(Annual_Entry_Exit_million))

ggplot(head(top_ten, n=50), aes(Year, Annual_Entry_Exit_million, color=Station, group=Station))+
  geom_point()+
  geom_line()

#Top ten Station  with lowest Passenger by year
top_ten_low<-usage_station_year %>%
  group_by(Station)%>%
  filter(Annual_Entry_Exit_million>0)%>%
  select(Station, Annual_Entry_Exit_million, Year)%>%
  arrange(Annual_Entry_Exit_million)

ggplot(head(top_ten_low, n=50), aes(Year, Annual_Entry_Exit_million, color=Station, group=Station))+
  geom_point(aes())+
  geom_line()

#Top ten Borough  with lowest Passenger by year
top_ten_low_borough<-usage_station_year %>%
  group_by(Borough, Year)%>%
  select(Borough, Annual_Entry_Exit_million, Year)%>%
  summarize(sum_annual_million = sum(Annual_Entry_Exit_million, na.rm = TRUE))%>%
  arrange(sum_annual_million)

ggplot(head(top_ten_low_borough, n=100), aes(Year, sum_annual_million, color=Borough, group=Borough))+
  geom_point()+
  geom_line()

#Top ten Borough with highest Passenger by year
top_ten_high_borough<-usage_station_year %>%
  group_by(Borough, Year)%>%
  filter(Annual_Entry_Exit_million>0)%>%
  select(Borough, Annual_Entry_Exit_million, Year)%>%
  summarize(sum_annual_million = sum(Annual_Entry_Exit_million, na.rm = TRUE))%>%
  arrange(desc(sum_annual_million))

ggplot(head(top_ten_high_borough, n=50), aes(Year, sum_annual_million, color=Borough, group=Borough))+
  geom_point(aes())+
  geom_line()


#number of Station by Borough
stationByBorough<-usage_station_year%>%
  group_by(Borough)%>%
  filter(Year==2017)


count_borough_station<-count(stationByBorough)%>%
  arrange(desc(n))

names(count_borough_station)[2]<-"Number_of_Station"

kable(count_borough_station)%>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

#merge count_borough_station & usage_station_year

weighted_usage_station_year<- merge(usage_station_year, count_borough_station, by.x= "Borough", by.y = "Borough")

weighted_annual_borough<- weighted_usage_station_year%>%
  group_by(Borough, Year)%>%
  filter(Annual_Entry_Exit_million>0)%>%
  select(Borough, Annual_Entry_Exit_million, Year, Number_of_Station)%>%
  summarise(annual_weighted = sum(Annual_Entry_Exit_million/Number_of_Station))%>%
  arrange(desc(annual_weighted))%>%
  filter(annual_weighted>15)

ggplot(head(weighted_annual_borough, n=100), aes(Year, annual_weighted, color=Borough, group=Borough))+
  geom_point(aes())+
  geom_line()

#merge count_borough_station & usage_station_year Low

weighted_annual_borough_low<- weighted_usage_station_year%>%
  group_by(Borough, Year)%>%
  filter(Annual_Entry_Exit_million>=0)%>%
  select(Borough, Annual_Entry_Exit_million, Year, Number_of_Station)%>%
  summarise(annual_weighted = sum(Annual_Entry_Exit_million/Number_of_Station))%>%
  arrange(annual_weighted)%>%
  filter(annual_weighted<2)

ggplot(head(weighted_annual_borough_low, n=200), aes(Year, annual_weighted, color=Borough, group=Borough))+
  geom_point(aes())+
  geom_line()

#Annual Entry in million per year
year_annual<-usage_station_year%>%
  group_by(Year)%>%
  summarize(annual_sum=sum(Annual_Entry_Exit_million))

ggplot(year_annual, aes(Year, annual_sum, group=1))+
  geom_point()+
  geom_line(color="Blue")


 #distribution des entrées anuelles par quartier
# ratio entrée/sortie pour la semaine et WE, identifier les aller-retour citoyen/visiteur

