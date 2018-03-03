

library(ggplot2)
library(dplyr)

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
  return(Area %>% ggplot(aes(long, lat)) + geom_polygon(aes(group = group, fill = subregion)) + 
           coord_cartesian(xlim = c(smallest, biggest)) + labs(title = paste(country, "Map"), x = "Longitude", y = "Latitude"))
}