# Consumer-Optimization

A complete end-to-end **data analysis project** focused on consumer behavior and sales optimization using Python, SQL, Excel, and Tableau.

This project explores an eCommerce dataset to draw actionable insights, such as top-selling products, customer lifetime value, and sales trends. The workflow spans from data preprocessing in Python to PostgreSQL querying, Excel validation, and Tableau dashboard visualization.

---

## Tools Used

- **Python** (Pandas, Matplotlib, Seaborn)
- **PostgreSQL** (data modeling and querying)
- **Excel** (intermediate analysis & exporting)
- **Tableau** (dashboard & storytelling)

---

## Repository Contents

| File | Description |
|------|-------------|
| `ecommerce-data.ipynb` | Data cleaning, preprocessing, and feature engineering |
| `data-visualization.ipynb` | EDA using Python visual libraries |
| `statistics-modeling.ipynb` | Trend analysis and basic statistical modeling |
| `erddesign.sql` | SQL schema and ERD creation for PostgreSQL |
| `queries.sql` | Business SQL queries (customer value, products, country) |
| `README.md` | Project overview |

---
## Dashboard Snapshot

![Dashboard 1](https://github.com/user-attachments/assets/bf02edab-a6a3-4e3f-a032-5c1ece53a436)


## Key Insights

### Monthly Sales Trend
- Sales increase steadily over the year with a peak in **November–December**, likely due to holiday shopping.

### Top Countries by Revenue
- The **United Kingdom** dominates sales by a wide margin.
- Netherlands and Germany follow with significantly less revenue.

### Top Products
- Products like **"WORLD WAR 2 GLIDERS"**, **"WHITE HANGING HEART T"**, and **"POPORN HOLDER"** are top contributors in quantity.

### Customer Lifetime Value (CLV)
- Identified high-value customers with revenue above **250K**.

### RFM Analysis (Recency, Frequency, Monetary)
- Segmented customers based on shopping behavior.
- Helps in targeting top-tier vs dormant customers.

---


 How to Run Locally
1. Clone the repository
```
 git clone https://github.com/AdrikaPanwar/Consumer-Optimization.git
cd Consumer-Optimization
```
2. Install necessary libraries
```
pip install pandas matplotlib seaborn jupyter
```
3. Open and run notebooks
 - Start with ``` ecommerce-data.ipynb ```
 - Proceed to ``` data-visualization.ipynb ``` and ``` statistics-modeling.ipynb ``` 
4. PostgreSQL Setup
- Use ``` erddesign.sql ``` to create schema
- Execute ``` queries.sql ``` to extract insights
5. Tableau Dashboard
Import the cleaned/exported data into Tableau for dashboarding

---
### Thankyou for Reading this
