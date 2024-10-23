# Load necessary libraries
library(shiny)
library(dplyr)
library(ggplot2)

# Load the dataset from the package
data("eclipse_data", package = "solarEclipses")

# Source UI and server scripts
source("ui.R")
source("server.R")

# Run the Shiny app
shinyApp(ui = ui, server = server)



