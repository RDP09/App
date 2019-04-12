library(shiny)
library(ggplot2)

# load data
data("mtcars")

# Define UI for the application
shinyUI(fluidPage(titlePanel("CarHorsepower's Predicted effect on MPG"),
                  
                  # Sidebar with a slider input for number of variables
                  sidebarLayout(sidebarPanel(h4("Choose Car HP"),
                                             
                                             sliderInput("hp", "HP",
                                                         min = min(mtcars$hp), max = max(mtcars$hp),
                                                         value = max(mtcars$hp) / 2, step = 5),
                                             
                                             h4("Predicted MPG"), verbatimTextOutput("predict"), width = 4),
                                
                                # Show a plot of the hp/MPG relationship
                                mainPanel("HP/MPG Relationship", plotOutput("distPlot"))
                  )))