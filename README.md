# 🏦 Bank Loan Portfolio Analysis

## 📌 Project Overview

This project analyzes a bank loan portfolio using **MySQL and Power BI** to understand loan application patterns, funding performance, repayment status, and observed credit-risk indicators.

The analysis transforms raw loan data into business-focused KPIs and an interactive Power BI dashboard to support portfolio monitoring and decision-making.

---

## 🎯 Business Problem

A bank needs to understand:

- How large is the loan portfolio?
- How much has been funded?
- What types of loans are customers taking?
- Which loan grades and states have higher application volumes?
- What is the distribution of loan repayment status?
- How does the observed charge-off rate vary across loan grades?
- How has loan application volume changed over time?

---

## 🛠️ Tools & Technologies

- **MySQL** – Data analysis and business queries
- **Power BI** – Data visualization and dashboard development
- **SQL** – Aggregation, filtering, grouping, CASE statements and date-based analysis

---

## 📊 Key KPIs

| KPI | Value |
|---|---:|
| Total Loan Applications | 38.576K |
| Total Funded Amount | 435.76M |
| Average Loan Amount | 11.30K |
| Average Interest Rate | 12.05% |

---

## 🔍 SQL Analysis

MySQL was used to analyze:

- Overall loan portfolio KPIs
- Loan status distribution
- Loan purpose and application volume
- Loan grade distribution
- State-wise loan applications
- Monthly loan application trends
- Charge-off rate
- Grade-wise charge-off rate

### SQL Concepts Used

- `COUNT()`
- `SUM()`
- `AVG()`
- `GROUP BY`
- `ORDER BY`
- `CASE WHEN`
- Date functions
- Conditional aggregation

---

## 📈 Power BI Dashboard

The interactive dashboard provides an executive-level overview of the loan portfolio.

### Dashboard includes:

- Total Loan Applications
- Total Funded Amount
- Average Loan Amount
- Average Interest Rate
- Loan Status Distribution
- Monthly Loan Application Trend
- Loan Applications by Purpose
- Loan Applications by Grade
- Top States by Loan Applications
- Charge-Off Rate by Grade

---

## 💡 Key Business Insights

- The portfolio contains approximately **38.6K loan applications** with **435.76M** in total funded amount.
- **Debt consolidation** represents the largest loan application purpose in the analyzed portfolio.
- Loan applications are concentrated across a few major loan grades, with **Grade B and Grade A** representing a significant portion of applications.
- Loan application volume shows an overall upward trend across the analyzed monthly period.
- Charge-off rates vary across loan grades, highlighting differences in observed portfolio performance.
- State-level analysis helps identify areas with higher concentrations of loan applications.

> Note: These observations describe patterns in the analyzed dataset and should not be interpreted as causal relationships or universal credit-risk rules.

---

## 📁 Project Structure

```text
Bank-Loan-Portfolio-Analysis/
│
├── SQL/
│   └── bank_loan_analysis.sql
│
├── PowerBI/
│   └── Bank_Loan_Analysis_Dashboard.pbix
│
└── README.md
