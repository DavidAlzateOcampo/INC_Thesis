<<<<<<< HEAD
=======
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
>>>>>>> 39263d94fe44e97f087bad97c8fb40820017651c

library(shiny)
library(ggplot2)
library(shinythemes)
library(shinydashboard)
source("source.R")

ui <- dashboardPage(
  dashboardHeader(title = main.Title),
  print.dashboard.main.side(),
  print.dashboard.Body()
)
