# Bank Loan Analytics Dashboard

## 📌 Project Overview

This project is a **Bank Loan Analytics Dashboard** developed using **SQL Server** and **Power BI**. It provides key insights into loan performance, borrower risk, and repayment trends to help financial institutions make data-driven lending decisions. The dashboard visualizes important **Key Performance Indicators (KPIs)** such as total loan applications, funded amounts, repayment trends, and borrower financial health.

## 🎯 Objective

The primary goal of this project is to provide a comprehensive **business intelligence solution** for monitoring and analyzing loan data, ensuring transparency, accuracy, and efficiency in lending operations.

## 🏗️ Features & Key Performance Indicators (KPIs)

### **Summary Dashboard (Overview of Loan Data)**

- **Total Loan Applications** (Overall, Month-to-Date, MoM Change)
- **Total Funded Amount** (Overall, Month-to-Date, MoM Change)
- **Total Amount Received** (Overall, Month-to-Date, MoM Change)
- **Average Interest Rate** (Overall, Month-to-Date, MoM Change)
- **Average Debt-to-Income Ratio (DTI)** (Overall, Month-to-Date, MoM Change)

### **Loan Status Analysis**

- **Good Loan vs Bad Loan** KPIs:
  - Good Loan Application Percentage
  - Good Loan Applications, Funded Amount & Total Received Amount
  - Bad Loan Application Percentage
  - Bad Loan Applications, Funded Amount & Total Received Amount
- **Loan Status Grid View**: Categorized insights into loan application status, repayment, and borrower financial health

### **Data Visualizations**

- **Monthly Trends by Issue Date (Line Chart)** - Identify seasonality & long-term trends
- **Regional Analysis by State (Filled Map)** - Assess regional disparities in lending
- **Loan Term Distribution (Donut Chart)** - Understand loan tenure patterns
- **Employment Length Impact (Bar Chart)** - Analyze borrowing trends by employment history
- **Loan Purpose Breakdown (Bar Chart)** - Identify common reasons for loan requests
- **Home Ownership Analysis (Tree Map)** - Assess the influence of homeownership on borrowing behavior

## 🛠️ Technology Stack

- **SQL Server 2022** (Data Extraction, Transformation & Validation)
- **Power BI** (Data Visualization & Reporting)
- **Excel** (Initial Data Source)

## ✅ SQL Data Validation

To ensure the accuracy of the Power BI visuals and KPIs, SQL queries were written for **data validation**. These queries cross-check:

- The total count of loan applications and funded amounts
- Month-over-Month (MoM) changes for key metrics
- Loan classification into Good/Bad categories
- Average interest rates and Debt-to-Income Ratios
- Data accuracy for each visualization component

## 📂 Folder Structure

```
📁 Bank Loan Dashboard
│-- 📂 Data  (Raw & Processed Data Files)
│-- 📂 SQL Queries  (Data Validation Queries)
│-- 📂 Reports  (Power BI Dashboard Files)
│-- README.md  (Project Documentation)
```

## 🚀 How to Run the Project

### **1️⃣ Setting up the SQL Server**

- Load the **Excel dataset** into **SQL Server 2022**
- Run the provided **SQL queries** to clean & transform the data
- Use SQL queries for data validation

### **2️⃣ Power BI Dashboard Setup**

- Import cleaned SQL data into **Power BI**
- Configure data relationships and create **DAX measures**
- Design and customize **visuals & KPIs**
- Validate results using SQL queries

## 🤝 Contribution

If you'd like to improve this project, feel free to **fork the repository**, make changes, and submit a **pull request**.

## 📩 Contact

For any queries, feel free to reach out!


