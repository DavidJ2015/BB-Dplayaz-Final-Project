source("./packages.R")
source("./maps.R")
source("./IndicatorLists.R")
source("./Table.R")
source("./charts.R")
library(shinydashboard)
library(dplyr)

L4 <- read.csv(file = "L4.csv", stringsAsFactors = FALSE)
Data <- L4 %>% filter(region.id != "NA", name != "Virgin Islands (U.S.)", name != "Tuvalu", name != "British Virgin Islands", name != "Gibraltar", name != "Channel Islands", name != "Curacao", name != "Micronesia, Fed. Sts.", name != "Hong Kong SAR, China", name != "Macao SAR, China", name != "St. Martin (French part)", name != "Sint Maarten (Dutch part)")
CountryNames <- Data %>% select(name)
CountryCodes <- Data %>% select(iso2Code)
#Variable <- c("Region" = "region.value", "Income Level" = "incomeLevel.value")colnames(IndicatorsData)
IndicatorsData <- read.csv(file = "IndicatorsData.csv", stringsAsFactors = FALSE)
Variable <- colnames(IndicatorsData)
Variable <- c(Variable)
Variable <- Variable[-1]

header <- dashboardHeader(title = "The World Bank Database")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Data Acknowledgements", tabName = "Intro", icon = icon("globe")), 
    menuItem("The World by Maps", tabName = "Maps", icon = icon("map-marker")),
    menuItem("The World by Charts", tabName = "Charts", icon = icon("globe")),
    menuItem("The World by Tables", tabName = "Tables", icon = icon("table")),
    menuItem("Indicators", tabName = "Indicators", icon = icon("globe"), 
             selectInput("Indicators", "Numbers", list("Education" = c(Education),
                                                                            "Population" = c(Population),
                                                                            "Health" = c(Health),
                                                                            "Economy" = c(Economy),
                                                                            "Fun Facts" = c(FunFacts)), selected = Population$Total, multiple = TRUE),
             selectInput("PercentIndicators", "Percentages", list("Education" = c(EducationPercentages),
                                                                                       "Population" = c(PopulationPercentages),
                                                                                       "Health" = c(HealthPercentages),
                                                                                       "Economy" = c(EconomyPercentages),
                                                                                       "Fun Facts" = c(FunFactsPercentages)), multiple = TRUE))
  )
)


body <- dashboardBody(
  tabItems(
    tabItem("Intro",
            fluidRow(
              box(
                width = 12, status = "primary", solidHeader = TRUE,
                title = "Application Introduction",
                textOutput("AppIntro")
              ),
              box(
                width = 12, color = "light-blue",
                title = "Data from World Bank",
                textOutput("DataAckn")
              )
            )
    ),
    tabItem("Maps",
            fluidRow(
              box(
                width = 12, status = "primary", solidHeader = TRUE,
                title = "United States of America",
                tabsetPanel(
                  id = "tabselected",
                  tabPanel("World Map", value = 1, plotOutput("WorldMap")),
                  tabPanel("Maps by Country", value = 2, plotOutput("MapsByCountry")),
                  tabPanel("Country by Variable", value = 3, plotOutput("CountryByVariable"))
                )
              ),
              box(
                width = 12, color = "light-blue",
                title = "Option",
                conditionalPanel(condition = "input.tabselected == 1",
                                 selectInput("WorldMapSelect", label = "Select a Country", choices = CountryNames, selected = "United States")),
                conditionalPanel(condition = "input.tabselected == 2",
                                 selectInput("MapsByCountrySelect", label = "Select a Country", choices = CountryNames, selected = "Canada")),
                conditionalPanel(condition = "input.tabselected == 3",
                                 selectInput("CountryByVariableSelect", label = "Select a Variable", choices = c(Variable), selected = "Population"),
                                 selectInput("SelectCat", label = "Select a Category", choices = 1:20, selected = 1),
                                 selectInput("SelectYear", label = "Select a Year", choices = 1960:2017, selected = "2012"))
              )
            )
    ),
    tabItem("Charts",
            fluidRow(
              box(
                width = 8, 
                title = "Type of Data to Compare",
                radioButtons("PerorNum", label = "One Or The Other", choices = list("Percentages" = TRUE, "Numerical" = FALSE))
              )
            ),
            column(width = 6,
                   box(
                     width = NULL, solidHeader = TRUE,
                     title = "Pie Chart (Select One Indicator)",
                     selectInput("SelectAYearPie", label = "Select A Year", choices = 1960:2017),
                     selectInput("Count_SelPie", label = "Country Selection (One Or More)", choices = CountryNames, multiple = TRUE),
                     textOutput("Charts1"),
                     plotOutput("distPlot1")
                   )
            ),
            column(width = 6,
                   box(
                     width = NULL, solidHeader = TRUE,
                     title = "Column Chart (Select One Indicator)",
                     selectInput("SelectAYearChart", label = "Select A Year", choices = 1960:2017),
                     selectInput("Count_SelChart", label = "Country Selection (One Or More)", choices = CountryNames, multiple = TRUE),
                     textOutput("Charts2"),
                     plotOutput("distPlot2")
                   )
            ),
            column(width = 12,
                   box(
                     width = NULL, solidHeader = TRUE,
                     title = "Plot Diagram (Select Two Indicators)",
                     textOutput("Charts3"),
                     plotOutput("distPlot3"),
                     selectInput("SelectAYearChart", label = "Select A Year", choices = 1960:2017),
                     radioButtons("consecutiveYearsChart", label = "Consecutive Years To Compare", choices = 1:5),
                     selectInput("Count_SelChart", label = "Country Selection", choices = CountryNames)
                   )
            )
    ),
    tabItem("Tables",
            fluidRow(
              box(
                width = 12, status = "primary", solidHeader = TRUE,
                title = "Raw Data Analysis",
                textOutput("Tables"),
                tableOutput("TableIn")
              ),
              column( width = 4, 
                      box(width = NULL,
                          title = "Table Options",
                          radioButtons("tableChoices", label = "Table Types", choices = list("Single Data Point" = "indicator", 
                                                                                             "Single Year" = "year",
                                                                                             "Single Country" = "country"))
                          
                      )
              ),
              column(width = 4,
                     
                     box(width = NULL,
                         title = "Single Data Point Option (One or More Countries & One Indicator)",
                         selectInput("SelectAYear", label = "Select A Year", choices = 1960:2017),
                         radioButtons("consecutiveYears", label = "Consecutive Years To Compare", choices = 1:5),
                         selectInput("Count_SelData", label = "Country Selection", choices = CountryNames, multiple = TRUE)
                     )
              ),
              column(width = 4,
                     box(width = NULL,
                         title = "Single Year Option (One or More Countries & One or More Indicators)",
                         selectInput("SelectYear", label = "Select A Year", choices = 1960:2017),
                         selectInput("Count_SelYear", label = "Country Selection", choices = CountryNames, multiple = TRUE)
                         
                     )
              ),
              
              column(width = 4,
                     box(
                       width = NULL,
                       title = "Single Country Option (One or More Indicators)",
                       selectInput("SelectYears", label = "Select A Year", choices = 1960:2017),
                       radioButtons("consecutiveYearsCountry", label = "Consecutive Years To Compare", choices = 1:5),
                       selectInput("Count_SelCountry", label = "Country Selection", choices = CountryNames)
                       
                     )
                     
              )
              
            )
    )
  )
)


dashboardPage(header, sidebar, body)
# Source code - https://rstudio.github.io/shinydashboard/examples.html
