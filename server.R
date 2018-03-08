source("./maps.R")
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
    "https://datacatalog.worldbank.org/dataset/health-nutrition-and-population-statistics"
  })
  
  output$Tables <- renderText({
    "Table generated here:"
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
    x <- toString(input$CountryByVariableSelect)
    y <- toString(input$SelectYear)
    cat <- input$SelectCat
    CountryAPIColor(x, y, "list(country_list)", cat)
  })
  
  output$TableIn <- renderTable({
    if(input$tableChoices == "countries"){
      }
    else if(input$tableChoices == "indicator"){
      year <- as.numeric(input$SelectAYear)
      year_last <- as.numeric(input$consecutiveYears) + as.numeric(input$SelectAYear)
      year_list <- year:year_last
      year_list <- as.character(year_list)
      year_list <- as.list(year_list)
      oneIndicator(input$Indicators[[1]], year_list, input$Count_SelData)
    }
    else if(input$tableChoices == "country"){
      year <- as.numeric(input$SelectYear)
      year_last <- as.numeric(input$consecutiveYearsCountry) + year
      year_list <- year:year_last
      year_list <- as.character(year_list)
      year_list <- as.list(year_list)
      oneCountry(input$Count_SelCountry, year_list, input$Indicators)
    }
    else if(input$tableChoices == "year"){
      OneYear(input$SelectYear, input$Count_SelYear, input$Indicators)
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
    year <- as.numeric(input$SelectAYearChart)
    year_last <- as.numeric(input$consecutiveYearsChart) + year
    year_list <- year:year_last
    year_list <- as.character(year_list)
    year_list <- as.list(year_list)
    print(year_list)
    if(input$PerorNum){
      value <- as.character(input$PercentIndicators[[1]])
      value2 <- as.character(input$PercentIndicators[[2]])
      Graph_Dot(value, value2, year_list, input$Count_SelChart)
    } else{
      value <- as.character(input$Indicators[[1]])
      value2 <- as.character(input$Indicators[[2]])
      Graph_Dot(value, value2, year_list, input$Count_SelChart)
    }
  })
  
  observe({
    x <- paste0(input$CountryByVariableSelect, ")")
    var <- eval(parse(text=paste("length(", x, sep = "")))
    updateSelectInput(session, "SelectCat", choices = 1:var)
  })
  
}

# Source code - https://rstudio.github.io/shinydashboard/examples.html