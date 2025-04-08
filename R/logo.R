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
#'   theme_tariff()
#' add_logo(p)
add_logo <- function(plot, 
                     corner_radius = 0.02, 
                     border_color = light_blue_color, 
                     border_size = 2,
                     logo_path = system.file("extdata", "logo.png", package = "tariffTheme"),
                     logo_position = "top right",
                     logo_width = 0.15) {
  
   # Load the logo image
  img <- image_read(logo_path)
  
  # Process the image to ensure proper transparency
  # Convert white background to transparent if needed
  img <- image_transparent(img, "white")
  
  # Get the plot title
  title <- plot$labels$title
  
  # Remove the original title from the plot
  plot$labels$title <- NULL
  
  # Remove border from plot background (we'll add it to the entire canvas)
  plot <- plot + theme(plot.background = element_rect(color = NA))
  
  # Create a new plot with the logo and title
  ggdraw(
    # Ensure the entire drawing canvas has the navy background
    ylim = c(0, 1),
    xlim = c(0, 1)
  ) + 
    # Draw background rectangle with navy color
    draw_grob(
      rectGrob(gp = gpar(fill = navy_color, col = NA), 
               width = unit(1, "npc"), 
               height = unit(1, "npc"))
    ) +
    # Draw the main plot - reduced height to make room for larger logo
    draw_plot(plot, x = 0, y = 0, width = 1, height = 0.8) +
    # Add the logo in the top-left corner with larger dimensions
    draw_image(img, x = 0.02, y = 0.8, width = 0.2, height = 0.2) +
    # Add the title shadow (slightly below and to the right of the main title)
    draw_text(
      title,
      x = 0.251, # Slightly shifted to the right
      y = 0.898, # Slightly shifted down
      hjust = 0,
      size = 20,
      fontface = "bold",
      color = yellow_color
    ) +
    # Add the main title text
    draw_text(
      title,
      x = 0.25, # Position title after logo
      y = 0.9, # Align with top of plot
      hjust = 0, 
      size = 20,
      fontface = "bold",
      color = "white") +
    # Add outer light blue rounded border
    draw_grob(
      grid::roundrectGrob(
        gp = gpar(fill = NA, col = light_blue_color, lwd = 2, lty = "dotted"),
        width = unit(1, "npc") - unit(1, "mm"), 
        height = unit(1, "npc") - unit(1, "mm"),
        r = unit(corner_radius, "npc")
      )
    ) +
    # Add inner yellow rounded border
    draw_grob(
      grid::roundrectGrob(
        gp = gpar(fill = NA, col = yellow_color, lwd = 2, lty = "dotted"),
        width = unit(1, "npc") - unit(5, "mm"), 
        height = unit(1, "npc") - unit(5, "mm"),
        r = unit(corner_radius * 0.8, "npc")  # Slightly smaller radius for inner border
      )
    )
}
