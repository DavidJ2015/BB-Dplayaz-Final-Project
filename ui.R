library(shinydashboard)


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

