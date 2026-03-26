# Amazon Sales Dashboard


An **interactive Shiny dashboard** for analyzing Amazon sales data, including product ratings, prices, and categories.
This project demonstrates **data cleaning, visualization, and interactive dashboarding** in R.

---

## 📌 Features

- **Interactive filters**: Filter by product category, price range, and minimum rating.
- **Key metrics**: Total products, average price, and average rating.
- **Visualizations**:
  - Price distribution by category (histogram).
  - Rating vs. discounted price (scatter plot with trendline).
- **Top-rated products**: Table of the highest-rated products based on filters.

---

## 📂 Project Structure

```
amazon-sales-dashboard/
│
├── data/                  # Place your dataset here (NOT included in Git)
│   └── amazon.csv         # Download from Kaggle (see Data section below)
│
├── R/
│   ├── 01_load_data.R     # Data loading and cleaning
│   ├── 02_analysis.R      # Analysis functions
│   └── 03_app.R           # Shiny app script
│
├── docs/
│   └── README.md          # Project documentation
│
├── .gitignore             # Specifies files to ignore in Git
└── LICENSE                # MIT License
```

---

## 🛠 Setup Instructions

### 1. Prerequisites

- [R](https://cran.r-project.org/) (>= 4.0.0)
- [RStudio](https://www.rstudio.com/products/rstudio/download/) (recommended)
- Git (for version control)

### 2. Clone the Repository

```bash
git clone https://github.com/yourusername/amazon-sales-dashboard.git
cd amazon-sales-dashboard
```

### 3. Install Dependencies

```r
install.packages(c("shiny", "dplyr", "ggplot2", "plotly", "here", "readr", "stringr"))
```

### 4. Add Your Data

- Download the dataset from Kaggle (see [Data](#-data) section below).
- Place `amazon.csv` in the `data/` folder.
- **Note**: The dataset is **not included in this repository**.

### 5. Run the App

```r
source("R/03_app.R")  # Launch the Shiny dashboard
```

The app will open in your default browser or RStudio's viewer pane.

---

## 📊 Data

### Source

The dataset used in this project is the **Amazon Sales Dataset**, publicly available on Kaggle:

> 📥 **Download here**: [Amazon Sales Dataset – Kaggle](https://www.kaggle.com/datasets/karkavelrajaj/amazon-sales-dataset?resource=download)
>
> *Provided by [karkavelrajaj](https://www.kaggle.com/karkavelrajaj) on Kaggle.*

After downloading, place the file at `data/amazon.csv` in the project root.

### Columns

| Column                | Description                                   |
|-----------------------|-----------------------------------------------|
| `product_id`          | Unique product ID                             |
| `product_name`        | Name of the product                           |
| `category`            | Product category (pipe-separated)             |
| `discounted_price`    | Discounted price (numeric)                    |
| `actual_price`        | Original price (numeric)                      |
| `discount_percentage` | Discount percentage (numeric)                 |
| `rating`              | Average product rating (1–5)                  |
| `rating_count`        | Number of ratings                             |
| `about_product`       | Product description                           |
| `user_id`             | User IDs (comma-separated)                    |
| `user_name`           | Usernames (comma-separated)                   |
| `review_id`           | Review IDs (comma-separated)                  |
| `review_title`        | Review titles (comma-separated)               |
| `review_content`      | Review content (comma-separated)              |
| `img_link`            | Product image URL                             |
| `product_link`        | Amazon product URL                            |

---

## 🔧 How It Works

1. **Data Loading**: The dataset is loaded and cleaned (e.g., removing `₹` symbols, converting prices to numeric).
2. **User Inputs**: Users select filters — category, price range, and minimum rating.
3. **Data Filtering**: The data is filtered reactively based on user inputs.
4. **Visualizations**: KPIs, charts, and tables are rendered dynamically using `ggplot2` and `plotly`.

---

## 🚀 Future Improvements

- Add **time-series trends** (e.g., sales over time).
- Include **sentiment analysis** of customer reviews.
- Deploy to **ShinyApps.io** or **RStudio Connect**.
- Add unit tests for data cleaning and analysis functions.

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- [Shiny](https://shiny.rstudio.com/) for the interactive dashboard framework.
- [ggplot2](https://ggplot2.tidyverse.org/) and [plotly](https://plotly.com/r/) for visualizations.
- [karkavelrajaj](https://www.kaggle.com/karkavelrajaj) on Kaggle for the Amazon Sales Dataset.
