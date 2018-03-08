##GGplot2 and dplyr must be installed on computer/drive in order for this script to function correctly

library(dplyr)
library(ggplot2)
library(ggrepel)
library(maps)
library(mapdata)
library(countrycode)

# World <- map_data("world") %>% filter(region != "Antarctica")
# World <- World %>% mutate(iso2Code = countrycode(World$region, "country.name", "iso2c", warn = FALSE))
# WorldHiRes <- map_data("world2Hires")
# WorldHiRes <- WorldHiRes %>% mutate(long = WorldHiRes$long - 360, iso2Code = countrycode(WorldHiRes$region, "country.name", "iso2c", warn = FALSE))
World <- read.csv("World.csv", stringsAsFactors = FALSE)
#WorldHiRes <- read.csv("WorldHiRes.csv", stringsAsFactors = FALSE)

L4 <- read.csv(file = "L4.csv")

JoinData <- inner_join(World, L4, by = "iso2Code")

CreateWorldMap <- ggplot() + geom_polygon(data = World, aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) + labs(x = "Longitude", y = "Latitude")

CreateMap <- function(Country){
  if (any((Country) == World$iso2Code)){
    Area <- World %>% filter(iso2Code == Country)
    Capital <- L4 %>% filter(iso2Code == Country)
    Capital <- Capital %>% mutate(capital = toString(Capital$capitalCity[1]), long = as.numeric(Capital$longitude[1]), lat = as.numeric(Capital$latitude[1]))
  } else {
    stop()
  }
  return(ggplot() + geom_polygon(data = Area, aes(x = long, y = lat, group = group)) + coord_fixed(1.3) + 
           geom_point(data = Capital, aes(x = long, y = lat), color = "blue") + 
           geom_label_repel(data = Capital, aes(x = long, y = lat, label = capital), color = "#325564", size = 3.5) + 
           labs(x = "Longitude", y = "Latitude"))
}

CreateMapHiRes <- function(Country){
  if (any((Country) == WorldHiRes$iso2Code)){
    Area <- WorldHiRes %>% filter(iso2Code == Country)
    Capital <- L4 %>% filter(iso2Code == Country)
    Capital <- Capital %>% mutate(capital = toString(Capital$capitalCity[1]), long = as.numeric(Capital$longitude[1]), lat = as.numeric(Capital$latitude[1]))
  } else {
    stop()
  }
  return(ggplot() + geom_polygon(data = Area, aes(x = long, y = lat, group = group)) + 
           coord_fixed(1.3) + labs(x = "Longitude", y = "Latitude") + 
           geom_label_repel(data = Capital, aes(x = long, y = lat, label = capital), color = "#325564", size = 3.5) + 
           labs(x = "Longitude", y = "Latitude"))
}

CountryHighlight <- function(Country){
  if (any((Country) == World$iso2Code)){
    Highlight <- World %>% filter(iso2Code == Country)
    Capital <- L4 %>% filter(iso2Code == Country)
    Capital <- Capital %>% mutate(capital = toString(Capital$capitalCity[1]), long = as.numeric(Capital$longitude[1]), lat = as.numeric(Capital$latitude[1]))
  } else {
    stop()
  }
  return(CreateWorldMap + geom_polygon(data = Highlight, aes(x = long, y = lat, group = group), fill = "#325564") + coord_fixed(1.3) + 
           geom_point(data = Capital, aes(x = long, y = lat), color = "blue") + 
           geom_label_repel(data = Capital, aes(x = long, y = lat, label = capital), color = "#325564", size = 3.5))
}

CountrySearch <- function(Col, Var){
  FilterData <- JoinData %>% filter(JoinData[Col] == Var)
  return(CreateWorldMap + geom_polygon(data = FilterData, aes(x = long, y = lat, group = group), fill = "green") + 
           coord_fixed(1.3) + labs(x = "Longitude", y = "Latitude"))
}

CountryColor <- function(Col){
  ToPlotData <- JoinData
  colnames(ToPlotData)[colnames(ToPlotData) == Col] <- "Fill"
  return(CreateWorldMap + geom_polygon(data = ToPlotData, aes(x = long, y = lat, group = group, fill = Fill), color = "black") + 
           coord_fixed(1.3) + labs(x = "Longitude", y = "Latitude", fill=""))
}

#CountryAPIColor("Population[[1]]", "2010", "list(\"China\", \"Vietnam\", \"Canada\")")
CountryAPIColor <- function(Indicator, Year, Countries, Cat){
  Catpaste <- paste0("[[", Cat,"]]")
  IndicatorPaste <- paste0(Indicator, Catpaste)
  x <- paste0(IndicatorPaste, ", ", Year, ", ", Countries, ")")
  APIData <- eval(parse(text=paste("staByYear(", x, sep = "")))
  APIData <- flatten(APIData)
  APIData <- APIData %>% mutate(value = replace(value, is.na(value),0))
  GetData <- APIData %>% mutate(iso2Code = countrycode(APIData$countryiso3code, "iso3c", "iso2c", warn = FALSE))
  ToPlotData <- JoinData %>% inner_join(GetData, L4, by = "iso2Code")
  return(CreateWorldMap + geom_polygon(data = ToPlotData, aes(x = long, y = lat, group = group, fill = value), color = "black") + 
           coord_fixed(1.3) + labs(x = "Longitude", y = "Latitude", fill=ToPlotData$indicator.value))
}
