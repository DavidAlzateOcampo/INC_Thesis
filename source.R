# Contains the names used in User interface

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
    box(plotOutput("distPlot")
        ,width = 8),
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
      ,sliderInput("bins", "Number of observations:", 1, 100, 50)
      ,print.selector.unique.val("dimension","radioButtons",label.nbr.dim,"get.choices.dimensions")
      ,dyn.print.selectors.1()
      #uiOutput("dimensions.selectors.1"),
      ,uiOutput("dimensions.selectors.2")
      
  )
  )
}
print.selector.unique.val<-function(valName,Type,labelVal,functionName){
  FUN <- match.fun(functionName) 
  switch(Type,
         "SelectInput"= selectInput(valName, label = labelVal, 
              choices = FUN()
             ,selected = 1)
        ,"radioButtons" = radioButtons(valName, label = labelVal,
                                       choices = FUN(),
                                       selected = 1)
        )
}
print.select.input.based.dim<-function(dimSelected){
  dimSelected
}
print.dimension.selector<-function(valSelect.dim
                                         ,variableName
                                         ,labelValue){
  listNames<-names(data)
  if(is.null(valSelect.dim)){
    cat("\n Esta nulo la variable ",variableName)
  }else{
    cat("\n La variable ",variableName, " es igual a : ",valSelect.dim)
    listNames<-listNames[!listNames %in% list(valSelect.dim)]
  }
  
  selectInput(variableName
              ,label = labelValue#label.choose.first.dim, 
              ,choices = listNames
              )
}


get.data.frm.csv<-function(fileName){
  cat(fileName)
  return(read.csv(fileName,header = T,na.strings = c('?','n.a','NA')))
}

get.df.column.class<-function(dataIn){
  max<-ncol(dataIn);
  dfOut<-data.frame(Variable=NULL
                   ,Class=NULL
                   ,Position=NULL
                   ,RangeMin=NULL
                   ,RangeMax=NULL)
  RangeMin<-NULL;
  RangeMax<-NULL;
  for(i in 1:max){
    RangeMin<-NULL;
    RangeMax<-NULL;
    RangeMin<-getRangeMin(dataIn[,i]);
    RangeMax<-getRangeMax(dataIn[,i]);
    Variable<-names(dataIn)[i];
    Class<-class(dataIn[,i]);
    
    dfOut<-rbind(dfOut,
           data.frame(
             Variable=Variable
            ,Class=Class
            ,Position=i
            ,RangeMin=RangeMin
            ,RangeMax=RangeMax
           ))
  }
  return(dfOut)
}

getRangeMin<-function(colVal){
  valMin<-NULL
  if(class(colVal)=="factor"){
    valMin<-sort(levels(colVal))[1]
  }else{
    valMin<-(min(colVal,na.rm = NA))
  }
  return(valMin)
}

getRangeMax<-function(colVal){
  valMax<-NULL
  if(class(colVal)=="factor"){
    valMax<-sort(levels(colVal))[length(colVal)]
  }
  else{
    valMax<-(max(colVal,na.rm = NA))
  }
  return(valMax)
}

get.choices.dimensions<-function(){
  a<-list();
  a[[label.1.dim]]=1;
  a[[label.2.dim]]=2;
  return(a)
  
}