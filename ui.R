shinyUI(
  fluidPage(
    titlePanel("Title"),
    sidebarLayout(
      sidebarPanel(
        textOutput("text")
      ),
      mainPanel(
        tabsetPanel(
          tabPanel("Tab 1",
                   textOutput("text1"),
                   plotOutput("tab1", height = "720")), 
          tabPanel("Tab 2",
                   textOutput("text2"),
                   plotOutput("tab2", height = "720")), 
          tabPanel("Tab 3",
                   textOutput("text3"),
                   plotOutput("tab3", height = "720")),
          tabPanel("Tab 4",
                   textOutput("text4"),
                   plotOutput("tab4", height = "720"))
        )
      )
    )
  )
)