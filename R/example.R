#' Example of using the tariffTheme package
#'
#' This script demonstrates how to use the tariffTheme package to create
#' a visualization of tariff data with consistent styling.
#'
#' @name tariff_example
#' @examples
#' library(ggplot2)
#' library(data.table)
#' library(tariffTheme)
#'
#' # Set a seed for reproducibility
#' set.seed(42)
#'
#' # Sample 10 random countries from the dataset
#' tariff_sample <- country_tariffs[sample(.N, 10)]
#'
#' # Make country a factor variable with randomized levels for better display
#' tariff_sample[, country := factor(country, levels = sample(country))]
#'
#' # Create the basic bar chart
#' tariff_plot <- ggplot(tariff_sample, aes(x = country, y = reciprocal_tariff_adjusted)) +
#'   geom_bar(stat = "identity", width = 0.7, fill = yellow_color) +
#'   geom_text(aes(label = paste0(reciprocal_tariff_adjusted, "%")), 
#'             position = position_stack(vjust = 0.5),
#'             color = "black") +
#'   labs(
#'     title = "Reciprocal Tariffs",
#'     x = "Country",
#'     y = "U.S.A Discounted Reciprocal Tariffs"
#'   ) +
#'   theme_tariff() +
#'   theme(axis.text.x = element_text(angle = 90, hjust = 1))
#'
#' # Add logo and borders to the plot
#' final_plot <- add_logo(tariff_plot)
#'
#' # Display the final plot
#' print(final_plot)
#'
NULL