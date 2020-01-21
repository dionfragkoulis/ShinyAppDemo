library(shiny)

shinyServer(function(input, output) {
    
    model <- reactive({
        lm(mtcars[, input$outcome] ~ mtcars[,input$predictor])
    })
    
    output$brush_info <- renderPrint({
        brushedPoints(mtcars, input$plot_brush, xvar = input$predictor, yvar = input$outcome)
    })
        
    output$scatterPlot <- renderPlot({

        plot(mtcars[,input$predictor], mtcars[,input$outcome], xlab = input$predictor, ylab = input$outcome, main = "Scatter Plot with Linear Model", pch = as.numeric(input$pointShape))
        
        if(input$showModel) {
        abline(model(), col = input$modelColor, lwd = 2)
        }
    })

})
