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
  
  output$WorldMap <- renderPlot({
    Var <- countrycode(input$WorldMapSelect, "country.name", "iso2c", warn = FALSE)
    CountryHighlight(Var)
  })
  
  output$MapsByCountry <- renderPlot({
    Var <- countrycode(input$MapsByCountrySelect, "country.name", "iso2c", warn = FALSE)
    CreateMap(Var)
  })
  
  output$CountryByVariable <- renderPlot({
    CountryColor(input$CountryByVariableSelect)
  })
  
  input$Indicators
  output$DataAckn <- renderText({
    input
  })
}

# Source code - https://rstudio.github.io/shinydashboard/examples.html