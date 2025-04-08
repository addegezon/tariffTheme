#' Custom ggplot2 theme for tariff visualizations
#'
#' A ggplot2 theme with a dark navy background, light blue and yellow accents,
#' and custom typography using the Merriweather font family.
#'
#' @param base_size Base font size for the theme (default: 24)
#' @param use_custom_font Whether to use Merriweather font (default: TRUE). Set to FALSE if fonts aren't available.
#' @return A ggplot2 theme object
#' @export
#' @importFrom ggplot2 theme_minimal theme element_rect element_text rel margin element_line element_blank %+replace%
#' @examples
#' library(ggplot2)
#' p <- ggplot(country_tariffs, aes(x = country, y = reciprocal_tariff_adjusted)) +
#'   geom_bar(stat = "identity", fill = yellow_color) +
#'   labs(title = "Reciprocal Tariffs") +
#'   theme_tariff(use_custom_font = FALSE)
#' p
theme_tariff <- function(base_size = 24, use_custom_font = TRUE) {  # Added parameter for font fallback
  
  # Set font family based on whether custom fonts should be used
  font_family <- if (use_custom_font) "Merriweather Light" else ""
  
  theme_minimal(base_size = base_size) %+replace%
    theme(
      # Background colors - removing the border as it will be added in add_logo
      plot.background = element_rect(fill = navy_color, color = NA),
      panel.background = element_rect(fill = navy_color, color = NA),
      
      # Text elements with default font
      text = element_text(color = "white"),
      plot.title = element_text(hjust = 0, size = rel(1.5), color = "white", family = font_family),
      plot.subtitle = element_text(hjust = 0, color = "white", family = font_family),
      plot.caption = element_text(color = "white", family = font_family),
      
      # Axis elements
      axis.text = element_text(color = light_blue_color, family = font_family),
      axis.title = element_text(color = "white", family = font_family, margin = margin(20,20,20,20)),
      axis.line = element_line(color = light_blue_color),
      axis.ticks = element_line(color = light_blue_color),
      
      # Grid lines - removed
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      
      # Legend
      legend.background = element_rect(fill = navy_color),
      legend.key = element_rect(fill = yellow_color),
      legend.text = element_text(color = "white", family = font_family),
      legend.title = element_text(color = "white", family = font_family),
      
      # Boxed text (like geom_label)
      plot.tag = element_text(color = "black", family = font_family)
    )
}