library(shiny)
library(dplyr)

shinyServer(
    function(input, output, session) {
        data <- reactive({
            inFile <- input$file1
            if (is.null(inFile)) { return(NULL) }
            read.csv(inFile$datapath, header = input$header, sep = input$sep, quote = input$quote)
        })

        # Updata value user could select
        observe({ updateSelectInput(session, "var1", choices = names(data())) })
        # Updata value user could select
        observe({ updateSelectInput(session, "var2", choices = names(data())) })

        # Output a histogram for the variables user chose
        output$graph <- renderPlot({
            var1 <- data()[, input$var1]
            var2 <- data()[, input$var2]
            if (is.null(var1)) { return(NULL) }
            if (is.null(var2)) { return(NULL) }
            graph2 <- ifelse(input$q2 == '0', FALSE, TRUE)
            p1 <- hist(var1, breaks = input$bins)
            if (input$q2 == '1' || input$q2 == '2')
                p2 <- hist(var2, breaks = input$bins)
            plot(p1, col = rgb(0, 0, 1, 1 / 4))
            if (input$q2 == '1' || input$q2 == '2')
                plot(p2, col = rgb(1, 0, 0, 1 / 4), add = graph2)
        })

        # Output of discriptive summary of this variable
        output$disc <- renderPrint({
            Data <- data()
            if (is.null(Data)) { return(NULL) }
            summary(Data)
        })

        # Output of the data structure
        output$str <- renderPrint({
            Data <- data()
            if (is.null(Data)) { return(NULL) }
            str(Data)
        })

        # Output of key statistical parametric
        output$parametric <- renderTable({
            var1 <- data()[, input$var1]
            if (is.null(var)) { return(NULL) }
            var2 <- data()[, input$var2]
            if (is.null(var)) { return(NULL) }
            mean1 <- mean(var1)
            mean2 <- mean(var2)
            standard_deviation1 <- sd(var1)
            standard_deviation2 <- sd(var2)
            standard_error1 <- sd(var1) / sqrt(length(var1))
            standard_error2 <- sd(var2) / sqrt(length(var2))
            parametric1 <- data.frame(mean = mean1,
                             standard_deviation = standard_deviation1,
                             standard_error = standard_error1)
            rownames(parametric1) <- input$var1
            parametric2 <- data.frame(mean = mean2,
                              standard_deviation = standard_deviation2,
                              standard_error = standard_error2)
            rownames(parametric2) <- input$var2
            if (input$q2 == "0") { return(parametric1) }
            if (input$q2 == "1" || input$q2 == "2") { return(rbind(parametric1, parametric2)) }
        })
        #testout <- reactive({
        #var1 <- data()[, input$var1]
        #conf <- input$conf
        #if (is.null(var1)) { return(NULL) }
        #t1 <- t.test(var1, alternative = input$tail, mu = input$test, conf.level = conf)
        #ve <- ifelse(input$varequal == 'y', TRUE, FALSE)
        #if (input$q2 == '1' || input$q2 == '2') {
        #var2 <- data()[, input$var2]
        #if (is.null(var2)) { return(NULL) }
        #t2 <- t.test(var1, var2, alternative = input$tail, var.equal = ve, conf.level = conf)
        #}
        #if (input$q2 == "0") { return(t1) }
        #if (input$q2 == '1' || input$q2 == '2') { return(t2) }
        #})



        # Output of one sample t value of t-test


        observeEvent(input$btn_click, {
            output$selectedTest <- renderText({
                test <- input$selectedTest
                if (is.null(test)) { return(NULL) }
                test
            })
            output$contents <- renderTable({
                tryCatch({
                    #df <- read.csv(input$file1$datapath,
                    #header = input$header,
                    #sep = input$sep)
                    #  output$value <- tr
                    res <- data()[, input$var1]

                    # output$value <- renderText({ length(res) })

                    test <- input$selectedTest

                    if (test == "1 sample t" || test == "2 sample t") {
                        testout <- reactive({
                            var1 <- data()[, input$var1]
                            conf <- input$conf
                            if (is.null(var1)) { return(NULL) }
                            t1 <- t.test(var1, alternative = input$tail, mu = input$test, conf.level = conf)
                            ve <- ifelse(input$varequal == 'y', TRUE, FALSE)
                            if (input$q2 == '1' || input$q2 == '2') {
                                var2 <- data()[, input$var2]
                                if (is.null(var2)) { return(NULL) }
                                t2 <- t.test(var1, var2, alternative = input$tail, var.equal = ve, conf.level = conf)
                            }
                            if (input$q2 == "0") { return(t1) }
                            if (input$q2 == '1' || input$q2 == '2') { return(t2) }
                        })
                    }


                    if (test == "1 sample proportion" || test == "2 sample proportion") {
                        testout <- reactive({
                            var1 <- data()[, input$var1]
                            conf <- input$conf
                            if (is.null(var1)) { return(NULL) }
                            t1 <- prop.test(var1,, alternative = input$tail, conf.level = conf)
                            #t.test(var1, alternative = input$tail, mu = input$test, conf.level = conf)
                            ve <- ifelse(input$varequal == 'y', TRUE, FALSE)
                            if (input$q2 == '1' || input$q2 == '2') {
                                var2 <- data()[, input$var2]
                                if (is.null(var2)) { return(NULL) }
                                t2 <- prop.test(var1, var2, alternative = input$tail, conf.level = conf)
                                #t.test(var1, var2, alternative = input$tail, var.equal = ve, conf.level = conf)

                            }
                            if (input$q2 == "0") { return(t1) }
                            if (input$q2 == '1' || input$q2 == '2') { return(t2) }
                        })
                    }

                    if (test == "1 sample wilcoxon" || test == "2 sample wilcoxon") {
                        testout <- reactive({
                            var1 <- data()[, input$var1]
                            conf <- input$conf
                            if (is.null(var1)) { return(NULL) }
                            t1 <- wilcox.test(var1, alternative = input$tail, mu = input$test, conf.level = conf)
                            if (input$q2 == '1' || input$q2 == '2') {
                                var2 <- data()[, input$var2]
                                if (is.null(var2)) { return(NULL) }
                                t2 <- wilcox.test(var1, var2, paired= TRUE ,alternative = input$tail, conf.level = conf)
                            }
                            if (input$q2 == "0") { return(t1) }
                            if (input$q2 == '1' || input$q2 == '2') { return(t2) }
                        })
                    }


                    output$tvalue <- renderPrint({
                        vals <- testout()
                        if (is.null(vals)) { return(NULL) }
                        vals$statistic
                    })

                    # Output of p value
                    output$pvalue <- renderPrint({
                        vals <- testout()
                        if (is.null(vals)) { return(NULL) }
                        vals$p.value
                    })
                },
              error = function(e) {
                # return a safeError if a parsing error occurs
                stop(safeError(e))
              }
            )
                return(data())
            })
        })


    }
)
