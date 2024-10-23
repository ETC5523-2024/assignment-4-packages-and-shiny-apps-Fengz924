#' Filter Eclipses by Type
#'
#' Filters solar eclipses based on the specified type: "Annular 2024" or "Total 2024".
#'
#' @param data A data frame containing solar eclipse information.
#' @param eclipse_type A string specifying the type of eclipse ("Annular 2024" or "Total 2024").
#' @return A data frame filtered by the specified eclipse type.
#'
#' @export
filter_eclipses_by_type <- function(data, eclipse_type) {
  if (!eclipse_type %in% c("Annular 2024", "Total 2024")) {
    stop("Invalid eclipse type. Choose either 'Annular 2024' or 'Total 2024'.")
  }
  data[data$Type == eclipse_type, ]
}
