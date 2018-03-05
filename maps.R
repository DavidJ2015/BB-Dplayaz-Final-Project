##GGplot2 and dplyr must be installed on computer/drive in order for this script to function correctly

source("packages.R")
library(dplyr)
library(ggplot2)
library(maps)
library(mapdata)

world <- map_data("world")
world <- world %>% filter(region != "Antarctica")
world$region <- tolower(world$region)

CreateMap <- function(country){
  if(tolower(country) == "world"){
    Area <- world
  } else if (any(tolower(country) == world$region)){
    Area <- world %>% filter(region == tolower(country))
  } else{
    stop()
  }
  smallest <- min(Area$long)
  biggest <- max(Area$long)
  return(Area %>% ggplot(aes(long, lat)) + geom_polygon(aes(group = group)) + 
           coord_cartesian(xlim = c(smallest, biggest)) + labs(x = "Longitude", y = "Latitude"))
}

CreateMapHiRes <- function(country){
  Area <- map_data(tolower(country)) # we already did this, but we can do it again
  return(ggplot() + geom_polygon(data = Area, aes(x=long, y = lat, group = group)) + 
           coord_fixed(1.3) + labs(x = "Longitude", y = "Latitude"))
}

#  return(Area %>% ggplot(aes(long, lat)) + geom_polygon(aes(group = group, fill = subregion)) + 
#           coord_cartesian(xlim = c(smallest, biggest)) + labs(title = paste(country, "Map"), x = "Longitude", y = "Latitude"))