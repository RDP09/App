library(shiny)
library(ggplot2)
library(curl)

# Define server logic
shinyServer(function(input, output) {
  
  # load data
  data("mtcars")
  
  # create the initial output
  output$distPlot <- renderPlot({
    
    
    # plot the mpg data vs hp
    p <- ggplot(data = mtcars, aes(x = hp , y = mpg)) + geom_point()
    p <- p + geom_smooth(method = "lm") + xlab("HP") + ylab("MPG")
    p <- p + xlim(50, 350) + ylim (10, 35)
    p 
  }, height = 700)
  
  # create linear model
  output$predict <- renderPrint({
    
    fit <- lm(mpg~hp,data=mtcars)
    hpinput <- input$hp
    unname(predict(fit, newdata = data.frame(hp = hpinput)))
  })
  observeEvent(input$predict, {distPlot <<- NULL
  output$distPlot <- renderPlot({p <- ggplot(data = mtcars, aes(x = hp, y = mpg)) + geom_point()
  p <- p + geom_smooth(method = "lm") + xlab("cyl") + ylab("mpg")
  p <- p + xlim(10, 350) + ylim (10, 35)
  p
  }, height = 700)})})