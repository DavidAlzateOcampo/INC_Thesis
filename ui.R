
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
