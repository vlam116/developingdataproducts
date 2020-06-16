library(shiny)

shinyUI(fluidPage(
    titlePanel("Predicting House Prices"),
    helpText("This application predicts the price of houses using three very commonly used characteristics
              in assessing house value: overall quality, above ground living area, and total rooms. The data
              used to build the model is from the famous Ames, Iowa Housing dataset."),
    sidebarLayout(
        sidebarPanel(
            helpText("Overall Quality rates the material and finish quality of a house. It ranges from
                     1 to 10, with 1 being the worst and 10 being the best."),
            sliderInput("sliderOQ", "What is the Overall Quality of the House?", 1, 10, value = 5),
            helpText("Above ground living space area (GrLivArea for short) measures the area of the house
                     above grade in square feet."),
            sliderInput("sliderGR", "What is the Above Ground Living Space Area?", 334, 5642, value = 1500),
            helpText("For total number of rooms, only rooms above ground count and it excludes bathrooms."),
            sliderInput("sliderTR", "What is the Total Number of Rooms in the House?", 2, 14, value = 6),
        ),
        mainPanel(
            img(src = "r.jpg", height = 320, width = 540),
            h3("Predicted Sale Price from Model 1:"),
            textOutput("pred1"),
            h3("Predicted Sale Price from Model 2:"),
            textOutput("pred2"),
            h3("Predicted Sale Price from Model 3:"),
            textOutput("pred3")
        )
    )
))