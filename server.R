source("packages.R")
source("maps.R")
source("./IndicatorLists.R")
source("./Table.R")
source("./charts.R")
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
  
  output$DataAckn <- renderText({
    input$Indicators
  })
  
  output$TableIn <- renderTable({
    if(input$tableChoices == "countries"){
      
    }
    else if(input$tableChoices == "indicator"){
      
    }
    else if(input$tableChoices == "country"){
      
    }
    else if(input$tableChoices == "year"){
      
    }
  })
  
  output$distPlot1 <- renderPlot({
    if(input$PerorNum){
      Graph_Pie(input$PercentIndicator[[1]], input$SelectAYearPie, input$Count_SelPie)
    } else{
      Graph_Pie(input$Indicators[[1]], input$SelectAYearPie, input$Count_SelPie)
    }

  })

}

# Source code - https://rstudio.github.io/shinydashboard/examples.html