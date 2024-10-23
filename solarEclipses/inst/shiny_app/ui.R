# Load necessary libraries
library(shiny)
library(shinydashboard)
library(solarEclipses)


# Define the UI using shinydashboard
ui <- dashboardPage(
  dashboardHeader(title = "Eclipse Data Explorer"),

  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("About", tabName = "about", icon = icon("info-circle"))
    )
  ),

  dashboardBody(
    tabItems(
      # Dashboard Tab
      tabItem(
        tabName = "dashboard",
        fluidRow(
          box(
            title = "Filters", status = "primary", solidHeader = TRUE, width = 4,
            selectInput(
              inputId = "eclipse_type",
              label = "Select Eclipse Type:",
              choices = unique(clean_eclipse_data$Type),
              selected = unique(clean_eclipse_data$Type)[1]
            ),
            sliderInput(
              inputId = "duration_filter",
              label = "Select Minimum Duration (in minutes):",
              min = min(clean_eclipse_data$duration, na.rm = TRUE),
              max = max(clean_eclipse_data$duration, na.rm = TRUE),
              value = min(clean_eclipse_data$duration, na.rm = TRUE)
            )
          ),
          box(
            title = "Eclipse Plot", status = "primary", solidHeader = TRUE, width = 8,
            plotOutput("eclipsePlot", height = 300)
          )
        ),
        fluidRow(
          box(
            title = "Filtered Data", status = "info", solidHeader = TRUE, width = 12,
            tableOutput("filteredData")
          )
        )
      ),
      # About Tab
      tabItem(
        tabName = "about",
        h3("About the Eclipse Data Explorer"),
        p("This dashboard allows users to explore eclipses by type and duration."),
        p("Use the filters to adjust the plot and table, discovering trends in the data.")
      )
    )
  )
)
