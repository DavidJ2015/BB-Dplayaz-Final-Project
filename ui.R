library(shinydashboard)


header <- dashboardHeader(title = "The World Bank Database")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("World Map", tabName = "Tab1", icon = icon("globe")),
    menuItem("United States Map", tabName = "Tab2", icon = icon("globe")),
    menuItem("Data Acknowledgements", tabName = "Tab1", icon = icon("globe")),
    menuItem("The World by Maps", tabName = "Maps", icon = icon("globe")),
    menuItem("The World by Charts", tabName = "Charts", icon = icon("globe")),
    menuItem("The World by Tables", tabName = "Tables", icon = icon("globe"),
    sliderInput("SliderData", "Slider", min = 0, max = 250, value = 500),
    selectInput("Indicator", label = h3("Input Data"), selected = NULL, choices = list("Choice 1" = 1, "Choice 2" = 2, 
                                                                                                "Choice 3" = 3)),
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
				  plotOutput("WorldMap", height = "600")
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
				  plotOutput("USA", height = "600")
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
				  plotOutput("Country", height = "600")
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

