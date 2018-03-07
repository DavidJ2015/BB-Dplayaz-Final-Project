source("packages.R")
source("API.R")
source("maps.R")
library(dplyr)
library(ggplot2)
library(maps)

function(input, output, session) {
  output$AppIntro <- renderText({
    "Introduction to this application here"
  })
  
  output$DataAckn <- renderText({
    "Acknoledgments about Data from World Bank here"
  })
  
  output$Charts <- renderText({
    "Got some charts here..."
  })
  
  output$Tables <- renderText({
    "Tables gallore, you cannot ignore"
  })

  output$WorldMap2 <- renderPlot({
    CreateWorldMap
  })
  
  output$TableIn <- renderTable({
    
  })
}

# Source code - https://rstudio.github.io/shinydashboard/examples.html