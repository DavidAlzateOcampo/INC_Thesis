# Contains the names used in User interface
source("UI_fld_names.R")

print.Plot.ini<-function(){
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
}
print.dashboard.main.side<-function(){
  dashboardSidebar(
    sidebarMenu(
      menuItem("Estadísticas", tabName = "stats", icon = icon("bar-chart-o")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
  )
}


print.dashboard.Body<-function(){
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "stats"
              ,print.tab.Stats.col1()
              ,hr()
              ,print.tab.Stats.col2()
              
      ),
      
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content")
      )
    )
  )
}
print.tab.Stats.col1<-function(){
  fluidRow(
    box(plotOutput("distPlot")),
    box(title = "Box title"
        , "Box content"
        , width = 2
    )  )
}
print.tab.Stats.col2<-function(){
  fluidRow(
    box(
      title = "Controls"
      ,sliderInput("bins", "Number of observations:", 1, 100, 50))
  )
}