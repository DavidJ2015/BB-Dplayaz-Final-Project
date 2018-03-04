library("dplyr")
library("ggplot2")
source("run.R")

shinyUI(
  function(input, output, session){
    output$text <- renderText({ 
      "Some text"
    })
    output$text1 <- renderText({ 
      "Some text 1"
    })
    output$text2 <- renderText({ 
      "Some text 2"
    })
    output$text3 <- renderText({ 
      "Some text 3"
    })
    output$text4 <- renderText({ 
      "Some text 4"
    })
  }
)