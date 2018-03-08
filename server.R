source("packages.R")
source("maps.R")
source("./IndicatorLists.R")
source("./Table.R")
source("./charts.R")
library(dplyr)
library(ggplot2)
library(maps)

L4 <- read.csv(file = "L4.csv", stringsAsFactors = FALSE)
Data <- L4 %>% filter(region.id != "NA", name != "Virgin Islands (U.S.)", name != "Tuvalu", name != "British Virgin Islands")
CountryNames <- Data %>% select(name) %>% mutate(country_name = name) %>% select(country_name)

function(input, output, session) {
  output$AppIntro <- renderText({
    print(intro)
  })
  
  output$DataAckn <- renderText({
    "Acknowledgments about Data from World Bank here"
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
      CountryNames
    }
    else if(input$tableChoices == "indicator"){
      oneIndicator()
    }
    else if(input$tableChoices == "country"){
      oneCountry()
    }
    else if(input$tableChoices == "year"){
      OneYear()
    }
  })
  
  output$distPlot1 <- renderPlot({
    if(input$PerorNum){
      value <- as.character(input$PercentIndicators[[1]])
      Graph_Pie(value, input$SelectAYearPie, input$Count_SelPie)
    } else{
      Graph_Pie(input$Indicators[[1]], input$SelectAYearPie, input$Count_SelPie)
    }

  })
  
  output$distPlot2 <- renderPlot({
    if(input$PerorNum){
      value <- as.character(input$PercentIndicators[[1]])
      Graph_Bar(value, input$SelectAYearChart, input$Count_SelChart)
    } else{
      Graph_Bar(input$Indicators[[1]], input$SelectAYearChart, input$Count_SelChart)
    }
  })
  
  output$distPlot3<- renderPlot({
    year <- input$SelectAYearChart
    year_last <- input$consecutiveYearsChart + year
    year_list <- year:year_last
    if(input$PerorNum){
      value <- as.character(input$PercentIndicators[[1]])
      value2 <- as.character(input$PercentIndicators[[2]])
      Graph_Dot(value, value2, year_list, input$Count_SelChart)
    } else{
      Graph_Bar(input$Indicators[[1]], input$Indicators[[2]], year_list, input$Count_SelChart)
    }
  })

}

# Source code - https://rstudio.github.io/shinydashboard/examples.html