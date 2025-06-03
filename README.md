# 📦 SmartYield: Customer Revenue & Spend Optimization

A unified analysis that combines segmentation, forecasting, cost modeling, and scenario simulation to optimize customer engagement and procurement strategy. Built on a real-world eCommerce dataset, SmartYield empowers data-driven decisions across marketing, operations, and finance.

---

## 🚀 Project Overview

SmartYield is an end-to-end analytics solution designed to simulate the day-to-day responsibilities of analysts working in revenue science, supply-demand planning, or procurement optimization. It integrates segmentation, cost modeling, forecasting, and SQL-based data exploration to unlock business-critical insights.

---

## 🧠 Business Context

Many businesses struggle with siloed insights across revenue, procurement, and customer retention. This project addresses those gaps by:

- Clustering customers and sellers based on behavioral and operational metrics.
- Forecasting future revenue using SARIMA models trained on historical sales.
- Modeling should-cost estimates by integrating freight and unit costs.
- Simulating discounting scenarios and their impact on segment profitability.

The goal is to enable cross-functional decisions grounded in data — from procurement cost benchmarking to customer retention tactics.

---

## 💼 Business Impact & Use Cases

| Outcome | Business Value |
|--------|----------------|
| 🎯 Segment-level engagement | Target promotions to profitable customer personas |
| 📈 Demand forecasting | Better align inventory and financial planning |
| 💰 Procurement intelligence | Identify cost-heavy SKUs and optimize vendor strategy |
| ⚖️ Scenario testing | Simulate pricing impacts before execution |
| 🧾 SQL-ready analysis | Supports scalable BI tool integration |

---

## 🧱 Methodology

### 📊 EDA & Data Preparation
- Merged order, product, payment, and logistics tables into a clean SQLite database.
- Created customer- and seller-level views for segmentation.
- Engineered features including total spend, AOV, fulfillment time, freight ratios, and SKU diversity.

### 👥 Segmentation
- Applied clustering algorithms (KMeans, Silhouette Scoring) to:
  - Identify high-value vs low-value customer personas.
  - Differentiate sellers by efficiency, diversity, and delivery performance.

### 📉 Forecasting & Cost Modeling
- Created a monthly revenue time series from completed transactions.
- Applied SARIMA models to forecast revenue trends and seasonality.
- Modeled should-cost per product category using freight + unit prices for procurement intelligence.

### 🔁 Scenario Simulation
- Tested pricing strategies (5–10% discounts) across customer segments.
- Evaluated tradeoffs between increased revenue vs margin erosion.
- Recommended pricing strategies based on customer cluster responsiveness.

---

## 📊 Key Findings

- High-spend customer clusters respond **positively to promotions** but require margin-sensitive targeting.
- Certain sellers deliver **above-average performance** despite lower SKU diversity.
- Product categories with **high freight overhead** are key candidates for renegotiation.
- Revenue forecasts align well with known eCommerce seasonality patterns (e.g., post-holiday dips).

---

## ✅ Key Recommendations

1. **Deploy cluster-specific discounting strategies** to optimize revenue lift without excessive margin erosion.
2. **Focus loyalty and retention efforts** on high-AOV customer personas.
3. **Use cost modeling insights** to flag product categories with procurement inefficiencies.
4. **Incorporate SARIMA forecasting into financial planning cycles** to anticipate seasonal swings.
5. **Adopt SQL-backed modular analytics pipelines** for reuse across BI and operations teams.

---

## 📦 Dataset Overview

This project uses the **Olist Brazilian E-Commerce Dataset**, which reflects real transactional behavior across thousands of orders and sellers in Brazil's largest online marketplace.

### 🔍 Source
- [Kaggle: Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

### 📐 Dataset Contents

| File | Description |
|------|-------------|
| `orders.csv` | Order metadata and timeline |
| `order_items.csv` | Line items per order |
| `order_payments.csv` | Payment method and value |
| `customers.csv` | Customer reference and location |
| `products.csv` | Product-level metadata |
| `product_category_name_translation.csv` | Category mappings to English |

- ~100,000 records across orders, items, and customers
- Merged and cleaned into a SQLite database: `olist.db`

---

## 🧠 SQL Scripts Explained

| File | Purpose |
|------|---------|
| `01_customer_spend_exploration.sql` | Summarize customer spend and order volume across time |
| `02_category_cost_modeling.sql` | Compute should-cost using product price + freight by category |
| `03_monthly_revenue_view.sql` | Create a revenue time series for forecasting models |

These modular SQL files were executed on the `olist.db` SQLite database and mirror typical BI queries used in enterprise analytics pipelines.

---

## 📁 Project Structure

```bash
project-root/
├── notebooks/
│   ├── EDA.ipynb                         # Preprocessing, joins, feature engineering
│   ├── Segmentation.ipynb               # Customer + seller clustering
│   ├── Forecasting.ipynb                # SARIMA forecasting + should-cost modeling
│   └── Scenario_Simulation.ipynb        # Discount simulation and margin analysis
│
├── sql/
│   ├── 01_customer_spend_exploration.sql
│   ├── 02_category_cost_modeling.sql
│   └── 03_monthly_revenue_view.sql
│
├── memo.pdf                             # Professional memo to senior executives
└── README.md                            # Project documentation (this file)
```

---

## ▶️ How to Run

### 🔧 Prerequisites
- Python 3.8+
- Jupyter Notebook or VS Code
- SQLite-compatible DB viewer (DB Browser or SQLiteStudio)

### 🧩 Steps
1. Clone this repository and unzip `olist_dataset`.
2. Open and run the notebooks in order from `01_` to `04_`.
3. Use `sql/` files in your DB viewer with `olist.db` to run analyses in SQL.
   
