library(shinydashboard)


Data <- L4 %>% filter(region.id != "NA", name != "Virgin Islands (U.S.)", name != "Tuvalu", name != "British Virgin Islands")
CountryNames <- Data %>% select(name)
CountryCodes <- Data %>% select(iso2Code)
Variable <- c("Region" = "region.value", "Income Level" = "incomeLevel.value")




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
              column(width = 6,
                box(
                  width = NULL, solidHeader = TRUE,
                  title = "Pie Chart",
                  textOutput("Charts1"),
                  plotOutput("distPlot1")
                )
              ),
              column(width = 6,
                 box(
                   width = NULL, solidHeader = TRUE,
                   title = "Column Chart",
                   textOutput("Charts2"),
                   plotOutput("distPlot2")
                 )
              ),
              column(width = 12,
                     box(
                       width = NULL, solidHeader = TRUE,
                       title = "Plot Diagram",
                       textOutput("Charts3"),
                       plotOutput("distPlot3")
                     )
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
                  dateRangeInput("SelectYears", label = "Select Range of Dates", min = "1960-01-01", max = "2017-01-01", 
                            start = "2000-01-01", end = "2015-01-01"),
                  selectInput("Count_Sel", label = "Country Selection", choices = list(1, 2 ,3))
                )
              ),
              column(width = 4,
                box(width = NULL,
                    title = "Single Year Option",
                    dateInput("SelectYear", label = "Select Date", min = "1960-01-01", max = "2017-01-01", value = "2000-01-01"),
                    selectInput("Count_Sel", label = "Country Selection", choices = list(1, 2 ,3))
                    
                )
              ),
              
              column(width = 4,
                box(
                  width = NULL,
                  title = "Single Country Option",
                  dateRangeInput("SelectYears", label = "Select Range of Dates", min = "1960-01-01", max = "2017-01-01", 
                                 start = "2000-01-01", end = "2015-01-01"),
                  selectInput("Count_Sel", label = "Country Selection", choices = list(1, 2 ,3))
                  
                )

              )
              
            )
    )
  )
)


dashboardPage(header, sidebar, body)

# Source code - https://rstudio.github.io/shinydashboard/examples.html