#' Launch the Shiny app
#'
#' This function launches the Shiny app included in the package.
#' @export
launch_app <- function() {
  shiny::runApp(system.file("app", package = "solarEclipses"), launch.browser = TRUE)
}
