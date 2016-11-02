library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict MPG"),
    sidebarLayout(
        sidebarPanel(
            h4("This is a simple application that predicts miles per gallon using horsepower
               , number of cylinders and transmission type."),
            hr(),
            h4("Select inputs below:"),
            hr(),
            sliderInput("sliderHP", "What is the HP of the car?", 10, 350, value = 100),
            numericInput("CYLinput", "How many cylinders (4, 6, or 8)?", 4, min = 4, max = 8, step = 2),
            #numericInput("AMinput", "What type of transimission?", 0, min = 0, max = 1, step = 1)
            selectInput("AMinput",
                        label = "What is the transmission type?",
                        choices = c("Manual", "Automatic"),
                        selected = "Manual")
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted MPG:"),
            textOutput("pred")
        )
    )
))
