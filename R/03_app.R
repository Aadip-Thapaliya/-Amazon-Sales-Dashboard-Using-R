library(shiny)
library(ggplot2)
library(plotly)
source(here::here("R", "01_load_data.R"))
source(here::here("R", "02_analysis.R"))

# Load data
sales_data <- load_sales_data()

# UI
ui <- fluidPage(
  titlePanel("Amazon Sales Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("category", "Select Product Category:",
                  choices = unique(sales_data$category),
                  selected = unique(sales_data$category)[1]),
      sliderInput("priceRange", "Select Discounted Price Range:",
                  min = min(sales_data$discounted_price, na.rm = TRUE),
                  max = max(sales_data$discounted_price, na.rm = TRUE),
                  value = c(min(sales_data$discounted_price, na.rm = TRUE),
                            max(sales_data$discounted_price, na.rm = TRUE)), step = 10),
      sliderInput("rating", "Select Minimum Rating:",
                  min = min(sales_data$rating, na.rm = TRUE),
                  max = max(sales_data$rating, na.rm = TRUE),
                  value = min(sales_data$rating, na.rm = TRUE), step = 0.1)
    ),
    mainPanel(
      h3("Key Performance Indicators (KPIs)"),
      verbatimTextOutput("kpis"),
      h3("Price Distribution by Category"),
      plotOutput("priceDistribution"),
      h3("Rating vs. Discounted Price"),
      plotOutput("ratingVsPrice"),
      h3("Top Rated Products"),
      tableOutput("topRatedProducts")
    )
  )
)

# Server
server <- function(input, output) {
  filtered_data <- reactive({
    filter_data(sales_data, input$category, input$priceRange, input$rating)
  })
  
  output$kpis <- renderPrint({
    kpis <- calculate_kpis(filtered_data())
    cat("Total Products:", kpis$total_products, "\n")
    cat("Average Discounted Price:", kpis$avg_discounted_price, "\n")
    cat("Average Rating:", kpis$avg_rating, "\n")
  })
  
  output$priceDistribution <- renderPlot({
    data <- filtered_data()
    ggplot(data, aes(x = discounted_price, fill = category)) +
      geom_histogram(bins = 30) +
      labs(title = "Price Distribution by Category", x = "Discounted Price", y = "Count") +
      theme_minimal()
  })
  
  output$ratingVsPrice <- renderPlot({
    data <- filtered_data()
    ggplot(data, aes(x = discounted_price, y = rating, color = category)) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE) +
      labs(title = "Rating vs. Discounted Price", x = "Discounted Price", y = "Rating") +
      theme_minimal()
  })
  
  output$topRatedProducts <- renderTable({
    data <- filtered_data()
    data %>%
      arrange(desc(rating)) %>%
      select(product_name, category, discounted_price, rating, rating_count) %>%
      head(10)
  })
}

# Run the app
shinyApp(ui = ui, server = server)