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
  
  output$Maps <- renderText({
    "These are not the maps you are looking for"
  })
  
  output$Charts <- renderText({
    "Got some charts here..."
  })
  
  output$Tables <- renderText({
    "Tables gallore, you cannot ignore"
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