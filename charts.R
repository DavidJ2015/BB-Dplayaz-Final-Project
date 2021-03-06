#The charts.R file takes in functions and variables made within the API.R and the 
#Table.R files. Then the functions are passed into more functions which help
#produce a bar chart and a pie chart
#
#

library(ggplot2)
library(dplyr)

source("./API.R")
source("./Table.R")

#Plots the bar graph
Graph_Bar <- function(indicator, year, list_of_countries) {
  graph_filtered <- OneYear(year, list_of_countries, list(indicator))
  p_bar_chart <- ggplot(graph_filtered, aes(name ,value, col = name)) + geom_bar(stat = "identity") +
    coord_cartesian(ylim = c(0, 100)) +
    coord_flip()
  return(p_bar_chart)
}

# #Plots the dot graph
 Graph_Dot <- function(indicatorOne, indicatorTwo, years, country) {
   indicatorOneUpdated <- list(indicatorOne, indicatorTwo)
   country_filter <- staByCountry(indicatorOneUpdated, years, country) %>% select(-data)
   d1 <- 1:length(colnames(country_filter))
   d2 <- 1:length(colnames(country_filter))
   for(i in 1:length(colnames(country_filter))){
     d1[i] <- country_filter[1, i]
     d2[i] <- country_filter[2, i]
   }
   new_data <- data.frame(x = d1, y = d2)
   p_dot_chart <- ggplot(new_data,  aes(x, y)) + geom_point()
   return(p_dot_chart)
 }

#Plots the Pie Chart
Graph_Pie <- function(indicator, year, list_of_countries) {
  print(indicator)
  graph_filtered <- OneYear(year, list_of_countries, list(indicator))
  p_bar_chart <- ggplot(graph_filtered, aes(name ,value, col = name)) + geom_bar(stat = "identity") +
    coord_cartesian(ylim = c(0, 100)) +
    coord_flip()
  pie <- p_bar_chart + coord_polar("y", start = 0) 
  return(pie)
}