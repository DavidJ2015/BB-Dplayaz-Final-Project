##GGplot2 and dplyr must be installed on computer/drive in order for this script to function correctly

source("packages.R")
source("API.R")
library(dplyr)
library(ggplot2)
library(maps)
library(mapdata)

World <- map_data("world") %>% filter(region != "Antarctica")
World <- World %>% mutate(iso2Code = countrycode(World$region, "country.name", "iso2c"))
WorldHiRes <- map_data("world2Hires") %>% filter(long - 360)

FlattenFunction <- function(flat){
  return(flatten(flat))
}

L4 <- FlattenFunction(L4)

CreateWorldMap <- ggplot() + geom_polygon(data = World, aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) + labs(x = "Longitude", y = "Latitude")

CreateMap <- function(Country){
  if (any((Country) == World$iso2Code)){
    Area <- World %>% filter(iso2Code == Country)
  } else {
    stop()
  }
  return(ggplot() + geom_polygon(data = Area, aes(x = long, y = lat, group = group)) + 
           coord_fixed(1.3) + labs(x = "Longitude", y = "Latitude"))
}

CreateMapHiRes <- function(Country){
  if (any((Country) == WorldHiRes$iso2Code)){
    Area <- WorldHiRes %>% filter(iso2Code == Country)
  } else {
    stop()
  }
  return(ggplot() + geom_polygon(data = Area, aes(x = long, y = lat, group = group)) + 
           coord_fixed(1.3) + labs(x = "Longitude", y = "Latitude"))
}

CountryHighlight <- function(Country){
  if (any((Country) == World$iso2Code)){
    Highlight <- World %>% filter(iso2Code == Country)
    Capital <- L4 %>% filter(iso2Code == Country)
    Capital <- Capital %>% mutate(capital = toString(Capital$capitalCity[1]), long = as.numeric(Capital$longitude[1]), lat = as.numeric(Capital$latitude[1]))
  } else {
    stop()
  }
  return(CreateWorldMap + geom_polygon(data = Highlight, aes(x = long, y = lat, group = group), fill = "red") + coord_fixed(1.3) + 
           geom_point(data = Capital, aes(x = long, y = lat), color = "blue") + 
           geom_label_repel(data = Capital, aes(x = long, y = lat, label = capital), color = 'red', size = 3.5))
}
data <- data %>% mutate(income.level = replace(data$incomeLevel.iso2code, "XT" == 10, NA))

CountryColor <- function(Type){
  data <- inner_join(World, L4, by = "iso2Code")
  HighIncome <- data %>% filter(incomeLevel.iso2code == "XD")
  return(CreateWorldMap + geom_polygon(data = HighIncome, aes(x = long, y = lat, group = group), fill = "blue") + 
           coord_fixed(1.3) + labs(x = "Longitude", y = "Latitude"))
}
