#' Country Tariffs Dataset
#'
#' A dataset containing reciprocal tariff rates for various countries.
#' This dataset provides tariff information that can be used for 
#' demonstrations and examples with the tariffTheme package.
#'
#' @format A data.table with 57 rows and 2 variables:
#' \describe{
#'   \item{country}{Country name}
#'   \item{reciprocal_tariff_adjusted}{Reciprocal tariff rate as a percentage}
#' }
#' @source Synthetic data for illustration purposes
"country_tariffs"

# The dataset is loaded from the data/ directory at package load time
# See data-raw/save_data.R for the code that generates this dataset