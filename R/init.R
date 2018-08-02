## testFun
#' A function that install all the librarys
#'
#' This function allows you prepare the librarys
#' @param 
#' @keywords 
#' @export
#' @examples
#' docker_init()
docker_init <- function(){
  install.packages('shiny', 'tidyverse', 'dplyr', 'ggplot2' )
  library('shiny', 'tidyverse', 'ggplot2')
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
  output$my_text <- renderText(input$sex)
}

run <- function(){
  shinyApp(ui = my_ui, server = my_server)
}