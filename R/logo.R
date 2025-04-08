#' Add a logo and styled borders to a ggplot visualization
#'
#' This function adds the tariff theme logo and styled borders to a ggplot visualization,
#' creating a finished, branded plot ready for presentation or publication.
#'
#' @param plot A ggplot object to enhance with logo and borders
#' @param corner_radius The radius of the rounded corners, from 0 to 1
#' @param border_color The color of the border, defaults to light blue
#' @param border_size The thickness of the border
#' @param logo_path Path to the logo image file, defaults to the package's logo
#' @param logo_position Position of the logo (one of "top right", "top left", "bottom right", "bottom left")
#' @param logo_width Proportional width of the logo
#'
#' @return A finalized plot with logo and borders
#' @export
#'
#' @importFrom magick image_read image_transparent
#' @importFrom grid rectGrob gpar unit
#' @importFrom cowplot ggdraw draw_grob draw_plot draw_image draw_text
#' @importFrom ggplot2 theme element_rect
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(country_tariffs, aes(x = country, y = reciprocal_tariff_adjusted)) +
#'   geom_bar(stat = "identity", fill = yellow_color) +
#'   labs(title = "Reciprocal Tariffs") +
#'   theme_tariff(use_custom_font = FALSE)
#' add_logo(p)
add_logo <- function(plot, 
                     corner_radius = 0.02, 
                     border_color = light_blue_color, 
                     border_size = 2,
                     logo_path = system.file("extdata", "logo.png", package = "tariffTheme"),
                     logo_position = "top right",
                     logo_width = 0.15) {
  
  # Load and prepare the logo image
  logo_img <- image_read(logo_path)
  logo_img <- image_transparent(logo_img, 'white')
  
  # Add rounded corners border
  plot <- plot + 
    theme(
      plot.background = element_rect(
        fill = navy_color,
        color = border_color,
        size = border_size,
        linetype = "solid"
      )
    )
  
  # Create a grob with rounded corners - note: older versions of grid don't support 'r' parameter
  # so we're using a regular rectangle instead to ensure compatibility
  corner_grob <- rectGrob(
    gp = gpar(fill = NA, col = border_color, lwd = border_size)
    # Removed r = unit(corner_radius, "npc") to ensure compatibility
  )
  
  # Determine logo position
  logo_positions <- list(
    "top right" = list(x = 0.95, y = 0.95, hjust = 1, vjust = 1),
    "top left" = list(x = 0.05, y = 0.95, hjust = 0, vjust = 1),
    "bottom right" = list(x = 0.95, y = 0.05, hjust = 1, vjust = 0),
    "bottom left" = list(x = 0.05, y = 0.05, hjust = 0, vjust = 0)
  )
  pos <- logo_positions[[logo_position]]
  
  # Use cowplot to combine plot, border, and logo
  ggdraw() +
    draw_grob(corner_grob) +
    draw_plot(plot, 0, 0, 1, 1) +
    draw_image(
      logo_img, 
      x = pos$x, 
      y = pos$y, 
      width = logo_width, 
      hjust = pos$hjust, 
      vjust = pos$vjust
    )
}