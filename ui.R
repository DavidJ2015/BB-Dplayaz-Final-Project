library(shinydashboard)


header <- dashboardHeader(title = "The World Bank Database")

sidebar <- dashboardSidebar(
  sidebarMenu(

    menuItem("Data Acknowledgements", tabName = "Tab1", icon = icon("globe")),
    menuItem("The World by Maps", tabName = "Tab2", icon = icon("globe")),
    menuItem("The World by Charts", tabName = "Tab3", icon = icon("globe")),
    menuItem("The World by Tables", tabName = "Tab4", icon = icon("globe"),
             sliderInput("SliderData", "Slider", min = 0, max = 250, value = 500),
             dateInput("SpeYear", "Date of Curiosity", value = "2000-01-01")
    )
  )
)

body <- dashboardBody(
  tabItems(
    tabItem("Tab1",
            fluidRow(
              box(
                width = 12, status = "primary", solidHeader = TRUE,
                title = "World Map",
                plotOutput("WorldMap1", height = "600")
              ),
              box(
                width = 12, color = "light-blue",
                title = "Option",
                textOutput("Text1")
              )
            )
    ),
    tabItem("Tab2",
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
    tabItem("Tab3",
            fluidRow(
              box(
                width = 12, status = "primary", solidHeader = TRUE,
                title = "Country Map",
                plotOutput("WorldMap3", height = "600")
              ),
              box(
                width = 12, color = "light-blue",
                title = "Option",
                textOutput("Text3"),
                selectInput("CountryName", label = "Select a Country",
                            choices = c("China", "Germany", "Canada"), selected = "China")
              )
            )
    ),
    tabItem("Tab4",
            textOutput("Text4")
    )
  )
)


dashboardPage(header, sidebar, body)

# Source code - https://rstudio.github.io/shinydashboard/examples.html

