# Load necessary libraries
library(shiny)
library(dplyr)
library(ggplot2)
library(solarEclipses)

# Load the dataset from the package
data("eclipse_data", package = "solarEclipses")

# Server Logic
server <- function(input, output) {

  # Reactive filter for the dataset based on user input
  filtered_data <- reactive({
    clean_eclipse_data %>%
      filter(Type == input$eclipse_type & duration >= input$duration_filter)
  })

  # Output plot based on filtered data
  output$eclipsePlot <- renderPlot({
    ggplot(filtered_data(), aes(x = lon, y = lat, color = duration)) +
      geom_point(size = 3) +
      labs(title = paste("Eclipse Locations for", input$eclipse_type),
           x = "Longitude", y = "Latitude", color = "Duration (min)") +
      theme_minimal()
  })

  # Output filtered data as a table
  output$filteredData <- renderTable({
    filtered_data()
  })
}

