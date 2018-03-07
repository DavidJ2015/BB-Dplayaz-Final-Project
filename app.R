library(shinydashboard)

header <- dashboardHeader(title = "World Bank Database")

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("World Map", tabName = "Tab1", icon = icon("globe")),
    menuItem("Some Graph", tabName = "Tab2", icon = icon("globe")),
    menuItem("Some Graph", tabName = "Tab3", icon = icon("globe")),
    menuItem("Some Graph", tabName = "Tab4", icon = icon("globe")),
    sliderInput("obs", "Number of observations:", min = 0, max = 1000, value = 500)
  )
)


body <- dashboardBody(
  tabItems(
    # Tab 1
    tabItem(
      tabName = "Tab1",
      titlePanel("World Map"),
      fluidRow(
        mainPanel(
          textOutput("text")
        )
      )
    ),
    # Tab 2
    tabItem(
      tabName = "Tab2",
      titlePanel("Some Title")
    )
  )
)


ui <- dashboardPage(header, sidebar, body)


server <- function(input, output) {
  output$text <- renderText({ 
    "Some text"
  })
}

shinyApp(ui, server)