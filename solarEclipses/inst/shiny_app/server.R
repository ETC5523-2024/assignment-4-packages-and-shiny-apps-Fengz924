library(shiny)

server <- function(input, output) {
  output$result <- renderText({
    paste("You selected:", input$var)
  })
}
