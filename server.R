## Horsepower Prediction: server.R Part 3

library(shiny)
shinyServer(function(input, output) {

    model <- lm(mpg ~ hp + cyl + am, data = mtcars)

    modelpred <- reactive({
        inputHP <- input$sliderHP
        inputCYL <- input$CYLinput
        inputAM <- ifelse(input$AMinput == "Manual", 1, 0)

        predict(model, newdata = data.frame(hp = inputHP, cyl = inputCYL, am = inputAM))
    })

    output$plot1 <- renderPlot({
        inputHP <- input$sliderHP

        plot(mtcars$mpg, mtcars$hp, xlab = "Miles Per Gallon",
             ylab = "Horsepower", bty = "n", pch = 16,
             xlim = c(10, 35), ylim = c(50, 350))
        abline(model, col = "red", lwd = 2)

        legend(25, 250, c("Model Prediction"), pch = 16,
               col = "red", bty = "n", cex = 1.2)
        points(inputHP, modelpred(), col = "red", pch = 16, cex = 2)

    })

    output$plot1 <- renderPlot({
        inputHP <- input$sliderHP
        inputCYL <- input$CYLinput
        inputAM <- ifelse(input$AMinput == "Manual", 1, 0)
        plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower",
             ylab = "MPG", bty = "n", pch = 16,
             xlim = c(50, 350), ylim = c(10, 35))

        # abline(model, col = "red", lwd = 2)

        legend(30, 300, c("Model Prediction"), pch = 16,
               col = "red", bty = "n", cex = 1.2)
        points(inputHP, modelpred(), col = "red", pch = 16, cex = 2)

    })
    output$pred <- renderText({
        modelpred()
    })

})
