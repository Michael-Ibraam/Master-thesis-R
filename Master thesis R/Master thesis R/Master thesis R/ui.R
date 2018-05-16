library(shiny)
library(shinyjs)
shinyUI(
  fluidPage(
            useShinyjs(),
    titlePanel(title = "Statistical test online web tool"),

    mainPanel(

               #  tags$head(tags$script(src = "js.js")),
                 includeHTML("www/index.html")
                 #("Main Panel"),
                  #align = "left",
                  #selectInput("selectInput_q1",
                            #label = h3(strong("What is the type of your data ?")),
                            #choices = list("Categorical" = "categorical", "Quantitative" = "quantitative"),
                            #width = "40%"
                           #),
                  #selectInput("selectInput_q2",
                            #label = h3(strong("How many Groups/Samples do you have ?")),
                            #choices = list("1" = 1, "2" = 2, "More than 2" = 3),
                            #width = "40%"

                            #),
                  #selectInput("selectInput_q3",
                            #label = h3(strong("What are you trying to achieve with this statistical test?")),
                            #choices = list("Compare samples data" = "compare", "Find a relationship between samples" = "relationship"),
                            #width = "40%"

                            #),
                  #textOutput("textOutput_value"),
                  #actionButton("actionButton_continue", "Continue")


                  )
  )
)
