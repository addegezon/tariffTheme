library(ggplot2)

test_that("add_logo function works correctly", {
  # Create a basic plot for testing
  p <- ggplot(data.frame(x = 1:3, y = 1:3), aes(x, y)) +
       geom_point() +
       labs(title = "Test Plot") +
       theme_tariff()
  
  # Test that add_logo returns an object of the correct class
  # We don't test the actual output as it depends on the logo file
  skip_if_not_installed("magick")
  skip_if_not(file.exists(system.file("extdata", "logo.png", package = "tariffTheme")), 
              "Logo file not found")
  
  result <- add_logo(p)
  expect_s3_class(result, c("gg", "ggplot"))
})

test_that("style_tariff_label function works correctly", {
  # Create a test plot
  p <- ggplot(data.frame(x = 1:3, y = 1:3), aes(x, y)) +
       geom_label(aes(label = "test")) +
       theme_tariff()
  
  # Test that style_tariff_label returns an object of the correct class
  result <- style_tariff_label(p)
  expect_s3_class(result, c("gg", "ggplot"))
  
  # Check that the theme elements were modified correctly
  modified_theme <- result$theme
  expect_equal(modified_theme$label.background$fill, yellow_color)
  expect_equal(modified_theme$label.color, "black")
})

test_that("country_tariffs dataset exists and has correct structure", {
  # Test that the dataset exists
  expect_true(exists("country_tariffs"))
  
  # Test that it has the correct structure
  expect_s3_class(country_tariffs, "data.table")
  expect_true(all(c("country", "reciprocal_tariff_adjusted") %in% names(country_tariffs)))
  
  # Test that it contains data
  expect_gt(nrow(country_tariffs), 0)
})