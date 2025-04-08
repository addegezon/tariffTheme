test_that("theme_tariff returns a theme object", {
  # Test that theme_tariff returns an object of the correct class
  theme <- theme_tariff()
  expect_s3_class(theme, "theme")
  
  # Test that the theme contains expected elements
  expect_true("text" %in% names(theme))
  expect_true("axis.text" %in% names(theme))
  expect_true("plot.background" %in% names(theme))
})

test_that("color variables are defined correctly", {
  # Test that the color variables are character strings
  expect_type(navy_color, "character")
  expect_type(light_blue_color, "character")
  expect_type(yellow_color, "character")
  
  # Test that they have the expected values
  expect_equal(navy_color, "#121325")
  expect_equal(light_blue_color, "#96d3e6")
  expect_equal(yellow_color, "#fad56a")
})

test_that("scale functions return ggplot2 scale objects", {
  # Test that scale functions return objects of the correct class
  color_scale <- scale_color_tariff()
  fill_scale <- scale_fill_tariff()
  
  expect_s3_class(color_scale, "ScaleDiscrete")
  expect_s3_class(fill_scale, "ScaleDiscrete")
})