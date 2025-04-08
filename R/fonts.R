#' Load Merriweather fonts for use with the tariff theme
#'
#' This function loads the Merriweather font family from the package
#' for use with the tariff theme visualization functions.
#'
#' @return Invisibly returns TRUE if fonts were successfully loaded
#' @export
#' @examples
#' \dontrun{
#' load_tariff_fonts()
#' }
load_tariff_fonts <- function() {
  # Path to font directory
  font_dir <- system.file("fonts", "Merriweather", package = "tariffTheme")
  
  if (requireNamespace("extrafont", quietly = TRUE)) {
    # Import fonts if they haven't been imported before
    if (!("Merriweather Light" %in% extrafont::fonts())) {
      message("Importing Merriweather fonts. This may take a moment...")
      extrafont::font_import(paths = font_dir, prompt = FALSE)
    }
    
    # Load the fonts for the current R session
    extrafont::loadfonts(device = "all", quiet = TRUE)
    
    message("Merriweather fonts loaded successfully.")
    return(invisible(TRUE))
  } else {
    warning("The extrafont package is required to use custom fonts. Please install it with install.packages('extrafont')")
    return(invisible(FALSE))
  }
}