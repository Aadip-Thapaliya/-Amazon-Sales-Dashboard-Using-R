# Load and clean the data
library(readr)
library(dplyr)
library(stringr)

load_sales_data <- function() {
  file_path <- here::here("data", "amazon.csv")
  sales_data <- read_csv(file_path)
  
  # Clean price and discount columns
  sales_data <- sales_data %>%
    mutate(
      discounted_price = as.numeric(str_remove(discounted_price, "₹") %>%
                                      str_replace_all(",", "")),
      actual_price = as.numeric(str_remove(actual_price, "₹") %>%
                                  str_replace_all(",", "")),
      discount_percentage = as.numeric(str_remove(discount_percentage, "%"))
    )
  
  return(sales_data)
}