# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(shinythemes)
library(shinydashboard)
source("source.R")
# shinyUI(
# 
#   fluidPage(
#     #shinythemes::themeSelector(),
#     titlePanel(main.Title),
#     navbarPage("Analisis",
#                tabPanel("Exploratorio",
#                         print.Plot.ini() )
#                )
#     )
# )

ui <- dashboardPage(
  dashboardHeader(title = main.Title),
  print.dashboard.main.side(),
  print.dashboard.Body()
)
