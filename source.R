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
      menuItem(label.Stats.Title, icon = icon(icon.Stats),
               menuSubItem(label.Stats.subItem1, tabName = "stats",icon=icon.Stats.pie),
               menuSubItem(label.Stats.subItem2, tabName = "subitem2")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
  )
}

#menuSubItem("Sub-item 1", tabName = "subitem1"),
#menuSubItem("Sub-item 2", tabName = "subitem2")


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
    box(plotOutput("distPlot"),width = 8),
    box(title = "Box title"
        , solidHeader = TRUE
        , background = color.background.box
        ,"A box with a solid light-blue background"
        , width = 2
    )  )
}
print.tab.Stats.col2<-function(){
  fluidRow(
    box(
      title = label.controls
      , solidHeader = TRUE
      ,status = "primary"
      ,sliderInput("bins", "Number of observations:", 1, 100, 50))
  )
}

get.data.frm.csv<-function(fileName){
  cat(fileName)
  return(read.csv(fileName,header = T))
  }