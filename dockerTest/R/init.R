## testFun
docker_init <- function(){
  install.packages('doParallel', 'shiny', 'tidyverse', 'dplyr', 'ggplot2' )
  library('doParallel', 'shiny', 'tidyverse', 'dplyr', 'ggplot2', 'tictoc')
}

library('shiny')
my_ui <- fluidPage( 
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "names", label = "Baby name(s)"),
      selectInput(inputId = "sex", "Sex", c("Male" = "M", "Female" = "F")),
      checkboxInput("number", "Plot number instead of proportion", F),
      sliderInput(inputId = "year", label = "Year range", val = c(1880, 2014), min = 1880, max = 2014)
    ),
    
    mainPanel(
      textOutput("my_text")
    )
  )
)

my_server <- function(input, output){
  output$name_plot <- renderPlot({
    name_funtion(input$names, year1 = input$year, sex1 = input$sex, number = input$number)
  })
  output$my_text <- renderText(input$sex)
}

run <- function(){
  shinyApp(ui = my_ui, server = my_server)
}