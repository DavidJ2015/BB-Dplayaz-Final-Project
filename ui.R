library(shinydashboard)

Data <- L4 %>% filter(region.id != "NA", name != "Virgin Islands (U.S.)", name != "Tuvalu", name != "British Virgin Islands")
CountryNames <- Data %>% select(name)
CountryCodes <- Data %>% select(iso2Code)
Variable <- c("Region" = "region.value", "Income Level" = "incomeLevel.value")

source("./Table.R")

header <- dashboardHeader(title = "The World Bank Database")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Data Acknowledgements", tabName = "Intro", icon = icon("globe")),
    menuItem("The World by Maps", tabName = "Maps", icon = icon("globe")),
    menuItem("The World by Charts", tabName = "Charts", icon = icon("globe")),
    menuItem("The World by Tables", tabName = "Tables", icon = icon("globe")
             
    )
  )
)

body <- dashboardBody(
  tabItems(
    tabItem("Intro",
            fluidRow(
              box(
                width = 12, status = "primary", solidHeader = TRUE,
                title = "Application Itroduction",
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
                                 selectInput("CountryByVariableSelect", label = "Select a Variable", choices = Variable, selected = "Region"))
              )
            )
    ),
    tabItem("Charts",
            fluidRow(
              box(
                width = 12, status = "primary", solidHeader = TRUE,
                title = "Chart Analysis",
                textOutput("Charts")
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
                          radioButtons("tableChoices", label = "Table Types", choices = list("Country & Regions List" = "countries", 
                                                                                             "Single Data Point" = "indicator", "One Country" = "country", "One Year" = "year"))
                          
                      )
              ),
              column(width = 4,
                     box(width = NULL,
                         title = "Single Data Point Option",
                         dateRangeInput("SelectYears", label = "Select Data", min = "1960-01-01", max = "2017-01-01", 
                                        start = "2000-01-01", end = "2015-01-01"),
                         selectInput("Count_Sel", label = "Country Selection", choices = )
                     )
              )
              
            )
    )
  )
)


dashboardPage(header, sidebar, body)

# Source code - https://rstudio.github.io/shinydashboard/examples.html