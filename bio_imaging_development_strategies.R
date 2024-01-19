library(shiny)
library(shinythemes)
library(shinyWidgets)
library(DT)
library(rmarkdown)
library(shinyjs)

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
     
      .navbar-brand {
        font-size: 17px; 
        margin-bottom: 10px;
        font-family: 'Verdana', sans-serif; 
      }
    "))
  ),
  
  navbarPage(
    id = "main_nav",
    title = div(class = "navbar-brand", "Bio-Imaging Development Strategies"),
    tabPanel("📊",
             fluidPage(
               pickerInput("chapter", "Choose an option:",
                           choices = c("Case Summary", 
                                       "Analysis")),
               uiOutput("chapter")))
    
    
    
  )
)

##########################################################################################################################################
##########################################################################################################################################
##########################################################################################################################################
##########################################################################################################################################
##########################################################################################################################################



server <- function(input, output, session) {
  active_tab <- reactiveVal("chapter")
  
  
  ################################## Chapter 1: Descision Analysis ###########################################
  
  
  output$chapter <- renderUI({
    req(input$chapter) 
    
    file_name <- switch(input$chapter,
                        "Case Summary" = "bio_imaging_development_strategies.html",
                        "Analysis" = "analysis_bio_imaging_development_strategies.html")
    
    if (!is.null(file_name)) {
      tags$iframe(src = file_name, style = "width:100%; height:800px;")
    }
  })
  
  observeEvent(input$main_nav, {
    active_tab(input$main_nav)
  })
  
  
  #########################################################################################################################################################
  
  
}

shinyApp(ui = ui, server = server)


