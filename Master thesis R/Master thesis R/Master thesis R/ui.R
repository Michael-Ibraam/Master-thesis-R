library(shiny)
shinyUI(
  fluidPage(
    titlePanel(title = "This is title"),
    sidebarPanel(
                  ("Side Panel Title"),
                  textInput("input_name", "Enter your name", ""),
                  textInput("input_age", "Enter your age", ""),
                  radioButtons("input_gender", "Select the gender", list("Male", "Female"), "")
    ),
    mainPanel(
                ("main"),
                textOutput("out_name"),
                textOutput("out_age"),
                textOutput("out_gender")

                )
  )
)