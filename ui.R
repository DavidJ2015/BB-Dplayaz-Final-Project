library(shinydashboard)

header <- dashboardHeader(title = "The World Bank Database")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("World Map", tabName = "Tab1", icon = icon("globe")),
    menuItem("United States Map", tabName = "Tab2", icon = icon("globe")),
	menuItem("Something 2", tabName = "Tab3", icon = icon("globe")),
	menuItem("Something 3", tabName = "Tab4", icon = icon("globe"))
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