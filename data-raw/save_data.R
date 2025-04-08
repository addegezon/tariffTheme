library(data.table)

# Create the country_tariffs dataset
country_tariffs <- data.table(
  country = c(
    "Algeria", "Angola", "Bangladesh", "Bosnia and Herzegovina", "Botswana", "Brunei", "Cambodia", "Cameroon", "Chad", "China", "Côte d`Ivoire", 
    "Democratic Republic of the Congo", "Equatorial Guinea", "European Union", "Falkland Islands", "Fiji", "Guyana", "India", "Indonesia", "Iraq", 
    "Israel", "Japan", "Jordan", "Kazakhstan", "Laos", "Lesotho", "Libya", "Liechtenstein", "Madagascar", "Malawi", "Malaysia", "Mauritius", 
    "Moldova", "Mozambique", "Myanmar (Burma)", "Namibia", "Nauru", "Nicaragua", "Nigeria", "North Macedonia", "Norway", "Pakistan", 
    "Philippines", "Serbia", "South Africa", "South Korea", "Sri Lanka", "Switzerland", "Syria", "Taiwan", "Thailand", "Tunisia", "Vanuatu", 
    "Venezuela", "Vietnam", "Zambia", "Zimbabwe"
  ),
  reciprocal_tariff_adjusted = c(
    30, 32, 37, 35, 37, 24, 49, 11, 13, 34, 21, 11, 13, 20, 41, 32, 38, 26, 32, 39, 17, 24, 20, 27, 48, 50, 31, 37, 47, 17, 24, 40, 31, 16, 44, 21, 
    30, 18, 14, 33, 15, 29, 17, 37, 30, 25, 44, 31, 41, 32, 36, 28, 22, 15, 46, 17, 18
  )
)

# Save the dataset to the data directory
usethis::use_data(country_tariffs, overwrite = TRUE)