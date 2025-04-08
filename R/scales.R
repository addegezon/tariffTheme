#' Custom color scale for tariff theme
#'
#' A function that provides a color scale using the theme's custom colors
#' 
#' @param ... Additional color values to append to the default palette
#' @return A ggplot2 scale object
#' @export
#' @importFrom ggplot2 scale_color_manual
#' @examples
#' library(ggplot2)
#' # Use a smaller subset of data for the example
#' ggplot(head(country_tariffs, 10), aes(x = country, y = reciprocal_tariff_adjusted, fill = country)) +
#'   geom_bar(stat = "identity") +
#'   scale_fill_tariff() +
#'   theme_tariff()
scale_color_tariff <- function(...) {
  # Create a palette with enough colors for any number of values
  # by repeating the base colors as needed
  base_colors <- c(yellow_color, light_blue_color, "white")
  
  # Calculate the number of repetitions needed to cover at least 100 values
  scale_color_manual(values = rep(base_colors, length.out = 100), 
                    aesthetics = c("colour", "color", "fill"),
                    ...)
}

#' Custom fill scale for tariff theme
#'
#' A function that provides a fill scale using the theme's custom colors
#' 
#' @param ... Additional color values to append to the default palette
#' @return A ggplot2 scale object
#' @export
#' @importFrom ggplot2 scale_fill_manual
#' @examples
#' library(ggplot2)
#' # Use a smaller subset of data for the example
#' ggplot(head(country_tariffs, 10), aes(x = country, y = reciprocal_tariff_adjusted, fill = country)) +
#'   geom_bar(stat = "identity") +
#'   scale_fill_tariff() +
#'   theme_tariff()
scale_fill_tariff <- function(...) {
  # Create a palette with enough colors for any number of values
  # by repeating the base colors as needed
  base_colors <- c(yellow_color, light_blue_color, "white")
  
  # Calculate the number of repetitions needed to cover at least 100 values
  scale_fill_manual(values = rep(base_colors, length.out = 100), 
                    aesthetics = c("colour", "color", "fill"),
                    ...)
}