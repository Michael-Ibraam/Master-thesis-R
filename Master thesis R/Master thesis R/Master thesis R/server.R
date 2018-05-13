library(shiny)
shinyServer(
  function(input, output) {
      output$out_name <- renderText(input$input_name)
      output$out_age <- renderText(input$input_age)
      output$out_gender <- renderText(input$input_gender)


  }
)