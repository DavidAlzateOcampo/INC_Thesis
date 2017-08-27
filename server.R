
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
<<<<<<< HEAD
source("source.R")


=======
>>>>>>> 5958f6d2f6437bfe01074d238654e7f7a2aa2af4

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })
<<<<<<< HEAD
  
=======
>>>>>>> 5958f6d2f6437bfe01074d238654e7f7a2aa2af4

})
