#' Launch the Shiny app
#'
#' @description This Shiny app allows users to explore solar eclipse data interactively.
#' Users can filter by eclipse type and minimum duration, visualize the locations on a map,
#' and view the filtered data in a table.
#'
#' This function launches the Shiny app included in the package.
#'
#' @return Opens a new web window displaying the interactive Shiny app.
#' @export
launch_app <- function() {
  app_dir <- system.file("shiny_app", package = "solarEclipses")
  if (app_dir == "") {
    stop("Could not find Shiny app directory. Try re-installing the package.", call. = FALSE)
  }
  shiny::runApp(app_dir, display.mode = "normal")
}
