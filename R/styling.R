#' Style labels for tariff theme
#'
#' A helper function to apply consistent styling to text labels and annotations
#' in visualizations using the tariff theme.
#'
#' @param g A ggplot object to which the styling will be applied
#' @return A ggplot object with styled labels
#' @export
#' @importFrom ggplot2 theme element_rect
#' @examples
#' library(ggplot2)
#' p <- ggplot(country_tariffs, aes(x = country, y = reciprocal_tariff_adjusted)) +
#'   geom_bar(stat = "identity", fill = yellow_color) +
#'   geom_label(aes(label = paste0(reciprocal_tariff_adjusted, "%"))) +
#'   theme_tariff(use_custom_font = FALSE)
#' style_tariff_label(p)
style_tariff_label <- function(g) {
  g + 
    theme(
      label.background = element_rect(fill = yellow_color),
      label.color = "black"
    )
}