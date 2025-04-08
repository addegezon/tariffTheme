#' Font information for the tariff theme
#'
#' This function provides information about the font usage in the package.
#' The package uses system fonts for better compatibility.
#'
#' @return Invisibly returns TRUE
#' @export
#' @examples
#' tariff_font_info()
tariff_font_info <- function() {
  message("tariffTheme uses your system's default fonts for better compatibility.")
  message("All theme elements have been configured to work with system fonts.")
  message("No additional font installation is required.")
  
  return(invisible(TRUE))
}