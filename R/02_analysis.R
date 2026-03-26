# Functions for data analysis
calculate_kpis <- function(data) {
  list(
    total_products = nrow(data),
    avg_discounted_price = mean(data$discounted_price, na.rm = TRUE),
    avg_rating = mean(data$rating, na.rm = TRUE)
  )
}

filter_data <- function(data, category, price_range, min_rating) {
  data %>%
    filter(category == category,
           discounted_price >= price_range[1],
           discounted_price <= price_range[2],
           rating >= min_rating)
}