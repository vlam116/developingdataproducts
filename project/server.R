library(shiny)
library(tidyverse)

setwd("C:/Users/Lam/Desktop/coursera/Course 9/developingdataproducts/project")
hp = read.csv("kaggletrain.csv")

hp = hp %>% select(SalePrice, OverallQual, TotRmsAbvGrd, GrLivArea)

shinyServer(function(input, output) {
    model1 = lm(SalePrice ~ ., data = hp)
    model2 = lm(SalePrice ~ GrLivArea + OverallQual, data = hp)
    model3 = lm(SalePrice ~ TotRmsAbvGrd, GrLivArea, data = hp)
    
    model1pred = reactive({
        oqInput = input$sliderOQ
        grInput = input$sliderGR
        trInput = input$sliderTR
        predict(model1, newdata = data.frame(OverallQual = oqInput, 
                                             GrLivArea = grInput,
                                             TotRmsAbvGrd = trInput))
    })
    
    model2pred = reactive({
        oqInput = input$sliderOQ
        grInput = input$sliderGR
        predict(model2, newdata = data.frame(GrLivArea = grInput,
                                             OverallQual = oqInput))
    })
    
    model3pred = reactive({
        trInput = input$sliderTR
        grInput = input$sliderGR
        predict(model3, newdata = data.frame(TotRmsAbvGrd = trInput,
                                             GrLivArea = grInput))
    })

    output$pred1 = renderText({
        model1pred()
    })
    
    output$pred2 = renderText({
        model2pred()
    })
    
    output$pred3 = renderText({
        model3pred()
    })
})
