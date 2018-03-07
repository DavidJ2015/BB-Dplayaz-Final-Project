source("packages.R")
source("API.R")
source("maps.R")
library(dplyr)
library(ggplot2)
library(maps)

function(input, output, session) {
  output$Text1 <- renderText({
    "Some options 1"
  })
  
  output$Text2 <- renderText({
    "Some options 2"
  })
  
  output$Text3 <- renderText({
    "Some options 3"
  })
  
  output$Text4 <- renderText({
    "Some options 4"
  })
  
  output$WorldMap1 <- renderPlot({
    CreateWorldMap
  })
  
  output$WorldMap2 <- renderPlot({
    CreateWorldMap
  })
  
  output$WorldMap3 <- renderPlot({
    CreateWorldMap
  })
}

# Source code - https://rstudio.github.io/shinydashboard/examples.html