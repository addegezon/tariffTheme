#' Custom ggplot2 theme for tariff visualizations
#'
#' A ggplot2 theme with a dark navy background, light blue and yellow accents,
#' using system typography for better compatibility.
#'
#' @param base_size Base font size for the theme (default: 24)
#' @return A ggplot2 theme object
#' @export
#' @importFrom ggplot2 theme_minimal theme element_rect element_text rel margin element_line element_blank %+replace%
#' @examples
#' library(ggplot2)
#' p <- ggplot(country_tariffs, aes(x = country, y = reciprocal_tariff_adjusted)) +
#'   geom_bar(stat = "identity", fill = yellow_color) +
#'   labs(title = "Reciprocal Tariffs") +
#'   theme_tariff()
#' p
theme_tariff <- function(base_size = 24) {
  
  theme_minimal(base_size = base_size) %+replace%
    theme(
      # Background colors - removing the border as it will be added in add_logo
      plot.background = element_rect(fill = navy_color, color = NA),
      panel.background = element_rect(fill = navy_color, color = NA),
      
      # Text elements with default font
      text = element_text(color = "white"),
      plot.title = element_text(hjust = 0, size = rel(1.5), color = "white"),
      plot.subtitle = element_text(hjust = 0, color = "white"),
      plot.caption = element_text(color = "white"),
      
      # Axis elements
      axis.text = element_text(color = light_blue_color),
      axis.title = element_text(color = "white", margin = margin(20,20,20,20)),
      axis.line = element_line(color = light_blue_color),
      axis.ticks = element_line(color = light_blue_color),
      
      # Grid lines - removed
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      
      # Legend
      legend.background = element_rect(fill = navy_color),
      legend.key = element_rect(fill = yellow_color),
      legend.text = element_text(color = "white"),
      legend.title = element_text(color = "white"),
      
      # Boxed text (like geom_label)
      plot.tag = element_text(color = "black")
    )
}