# 📊 Customer Acquisition Analytics with Python, PostgreSQL & Power BI

🚀 Overview

This project explores the performance of customer acquisition channels using real-world metrics like Cost Per Acquisition (CPA), Return on Ad Spend (ROAS), and estimated conversions. The dataset includes over 700 rows of acquisition data across channels such as referral, paid advertising, email marketing, and social media.

📌 Business Objective: Identify which acquisition channels are most cost-efficient and revenue-generating to guide marketing decisions.

# 🛠 Tech Stack

Python: pandas, SQLAlchemy, psycopg2

PostgreSQL: for relational data storage and SQL querying

Power BI: for dashboarding and visual storytelling

Jupyter Notebook (optional): for exploratory analysis and commentary

# 🔄 Data Workflow

Load CSV into PostgreSQL

Python script (load_data.py) reads and imports customer_acquisition_data.csv into a PostgreSQL table.

# SQL Transformations

A reusable SQL view (metrics.sql) calculates key metrics per channel:

CREATE OR REPLACE VIEW metrics_by_channel AS

SELECT
  channel,
  SUM(cost) / NULLIF(SUM(conversion_rate), 0) AS cpa,
  
  SUM(revenue) / NULLIF(SUM(cost), 0) AS roas,
  
  SUM(conversion_rate) AS estimated_acquisitions
  
FROM customer_acquisition_data

GROUP BY channel;

# 📈 Key Metrics Explained

Metric & Discription

CPA Cost per acquired customer = cost ÷ conversions

ROAS Revenue per rand spent = revenue ÷ cost

Acquisitions  Estimated from aggregated conversion_rate



# 🔍 Insights

<img width="1752" height="776" alt="Screenshot (12)" src="https://github.com/user-attachments/assets/b85e3299-92eb-4eb4-8ec8-0ffc688fe266" />


<img width="1371" height="768" alt="Screenshot (13)" src="https://github.com/user-attachments/assets/28b24752-b348-408f-893b-60f8af268a6b" />


Referral channels consistently yielded lower CPA and higher ROAS, making them highly efficient.

Paid advertising had higher costs and moderate ROAS, suggesting potential for optimization.

Social media showed strong conversion potential but varied in ROI based on spend.

# 📁 Folder Contents

File Name

Purpose

customer_acquisition_data.csv

Source dataset

load_data.py

Python script to ingest data into PostgreSQL

metrics.sql

SQL view with business metrics

dashboard.pbix

Power BI report (if included)

README.md

Project documentation

