library(shinydashboard)
source("./IndicatorLists.R")


header <- dashboardHeader(title = "The World Bank Database")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Data Acknowledgements", tabName = "Intro", icon = icon("globe")), 
    menuItem("The World by Maps", tabName = "Maps", icon = icon("map-marker")),
    menuItem("The World by Charts", tabName = "Charts", icon = icon("globe")),
    menuItem("The World by Tables", tabName = "Tables", icon = icon("table")),
    menuItem("The World's Indicators", tabName = "Indicators", icon = icon("globe"), 
             selectInput("Indicators", "Numbers (Select one or more)", list("Unemployment" = c(Employment),
                                                                  "Education" = c(Education),
                                                                  "Population" = c(Population),
                                                                  "Health" = c(Health),
                                                                  "Economy" = c(Economy),
                                                                  "Fun Facts" = c(FunFacts)), multiple = TRUE),
             selectInput("PercentIndicators", "Percentages (Select one or more)", list("Unemployment" = c(UnemploymentPercentages),
                                                                "Education" = c(EducationPercentages),
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
                plotOutput("WorldMap2", height = "600")
              ),
              box(
                width = 12, color = "light-blue",
                title = "Option",
                textOutput("Text2")
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
                textOutput("Tables")
              )
            )
    )
  )
)


dashboardPage(header, sidebar, body)

# Source code - https://rstudio.github.io/shinydashboard/examples.html

