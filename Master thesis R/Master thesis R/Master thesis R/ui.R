library(shiny)
library(shinyjs)
library(shinythemes)

shinyUI(
fluidPage(

    useShinyjs(),
    titlePanel(title = "Statistical test online web tool"),
    sidebarPanel(
                includeHTML("www/index.html"),
                 # Horizontal line ----
                 tags$hr(),

                 fileInput("file1", "Choose CSV File",
                                                multiple = FALSE,
                                                accept = c("text/csv",
                                                         "text/comma-separated-values,text/plain",
                                                         ".csv")),
                 # Horizontal line ----
                 tags$hr(),

                 # Input: Checkbox if file has header ----
                 checkboxInput("header", "Header", TRUE),

                 # Input: Select separator ----
                 radioButtons("sep", "Separator",
                                                   choices = c(Comma = ",",
                                                               Semicolon = ";",
                                                               Tab = "\t"),
                                                   selected = ","),
                actionButton("btn_click", "Click", onclick = "btn_continue_click()"),
                
                     sliderInput("bins",
                                 "Numer of bins:",
                                 min = 1,
                                 max = 50,
                                 value = 2
                     ),
                     radioButtons("sample",
                                 "Please choose one sample t test or two sample t test:",
                                 choices = c("One sample" = "oneSamp",
                                             "Two sample" = "twoSamp")),
                     selectInput("var1",
                                 label = "Please Select a Numerical Variable",
                                 ""
                     ),
                     conditionalPanel(condition = "input.q2 == '1' || input.q2 == '2'",
                                      selectInput("var2",
                                                  label = "Please Select a Numerical Variable",
                                                  ""
                                      ),
                                      radioButtons("varequal",
                                                   "Are the two samples have equal variance:",
                                                   choices = c("Yes" = "y",
                                                               "No" = "n"))
                                      ),

                     #conditionalPanel(condition = "input.sample == 'twoSamp'",
                                      #selectInput("var2",
                                                  #label = "Please Select a Numerical Variable",
                                                  #""
                                      #),
                                      #radioButtons("varequal",
                                                   #"Are the two samples have equal variance:",
                                                   #choices = c("Yes" = "y",
                                                               #"No" = "n"))
                                      #),
                     selectInput("tail",
                                 label = "Please Select a relationship you want to test:",
                                 choices = c("Equal" = "two.sided",
                                             "Less" = "less",
                                             "Greater" = "greater")),
                     conditionalPanel(condition = "input.sample == 'oneSamp'",
                                      numericInput("test",
                                                   "Mean value You Want to Test",
                                                   value = 0

                                                   )
                                      ),
                     numericInput("conf",
                                 label = "Please Select a confidence level:",
                                 value = 0.95,
                                 min = 0.8,
                                 max = 0.99),
                     helpText("Note: Please assign a number between 0 and 1 in the numeric Input")

                     
    ),
    mainPanel(

    tabsetPanel(
                   tabPanel('Data View',
                   fluidRow(column(10, offset = 1,
                               h2("Selected statistical test"),
                               verbatimTextOutput('selectedTest'))),
                   fluidRow(column(10, offset = 1,
                               h2("Data Summary"),
                               verbatimTextOutput('disc'))),

                   fluidRow(column(10, offset = 1,
                               h2("Data Structure"),
                               verbatimTextOutput('str'))),
                   fluidRow(column(10, offset = 1,
                               h2("Data Table"),
                               tableOutput('contents')))
                   ),
                   tabPanel('T-test',
                   fluidRow(column(10, offset = 1,
                               plotOutput('graph'))),
                   fluidRow(column(8, offset = 1,
                               h2("Key summary statistics"),
                               p("The observed sample statistics were:"),
                               tableOutput('parametric'),
                               h2("Hypothesis of the t-test"),
                               p("We are testing the null hypothesis that the mean of population equals to the value you set"),
                               p("The observed t test statistic :"),
                               textOutput('tvalue'),
                               p("A low P value suggests that your sample provides enough evidence that you can reject the null hypothesis for the entire population."),
                               textOutput('pvalue')))
                   )

              )

                # Horizontal line ----
                #tags$hr(),
                #hr(),
                #fluidRow(column(3, verbatimTextOutput("value"))),

             #   tableOutput("contents"),

             #   tableOutput("data"),



                                   
          )
  )
  )

