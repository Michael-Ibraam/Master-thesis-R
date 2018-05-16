library(shiny)
shinyServer(
  function(input, output) {
      output$textOutput_value <- renderPrint(input$selectInput_q3)
      #observeEvent(input$actionButton_continue,
      #             alert("This is an alert message. Thanks for watching this video"))
     # observeEvent(input$actionButton_continue,
      #             session$sendCustomMessage('PopUpGenerator', list(text = input$TitleInput)))


  }
)