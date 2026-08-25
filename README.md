# Telco Customer Churn Analysis & Prediction

End-to-end churn analysis project combining **SQL**, **Python (logistic regression)**, and **Power BI** — built to identify why customers leave a telecom company and validate the findings across three independent methods.

## 📊 Dashboard Preview
<img width="1332" height="756" alt="dashboard_screenshot" src="https://github.com/user-attachments/assets/04623a5f-e648-493f-ae12-7899a07cdfe5" />

## 🎯 Project Overview

Using the [Telco Customer Churn dataset](https://www.kaggle.com/datasets/blastchar/telco-customer-churn) (7,043 customers, 21 features), this project:
- Cleans and prepares the data using **Python (pandas)**
- Builds a **logistic regression model** to predict churn (81.3% accuracy)
- Writes **SQL queries** to break down churn rate by key business segments
- Builds an interactive **Power BI dashboard** with KPIs and AI-driven driver analysis

The core question: **which customers are most likely to churn, and why?**

## 🔑 Key Findings

Three independent methods — model coefficients, SQL aggregation, and Power BI's Key Influencers AI — all converged on the same top churn drivers:

| Driver | Python (Logistic Regression) | SQL | Power BI (Key Influencers) |
|---|---|---|---|
| **Contract type** | Strongest predictor (coef -1.48 for 2yr) | Month-to-month churns far more than 1yr/2yr | +0.36 influence |
| **Tenure** | 2nd strongest (coef -1.36) | 47% churn in first 12 months → 9.5% after 48 months | +0.34 influence |
| **Online Security** | coef -0.40 | — | +0.30 influence |
| **Payment method** | coef +0.31 (electronic check) | Electronic check: 45.3% churn vs. 15.2% for credit card | +0.28 influence |
| **Internet service** | coef +1.02 (fiber optic) | Fiber: 41.9% churn vs. 18.96% for DSL | +0.27 influence |

**Business impact:** $139,130.85 in monthly recurring revenue (~$1.67M annually) is at risk from churned customers.

## 📁 Repository Structure
Telco-Customer-Churn_dataset.csv # Original dataset
Telco-Customer-Churn_dataset_cleaned.csv # Cleaned version (used in SQL/Power BI)
Churn_Analysis.ipynb # Data cleaning, EDA, logistic regression model
Customer_Churn.sql # Churn-rate queries by segment
Customer churn prediction.pbix # Interactive dashboard
dashboard_screenshot.png # dashboard screenshot


## 🐍 Python: Cleaning & Modeling

**Data cleaning:**
- Converted `TotalCharges` from text to numeric (fixed 11 blank values)
- Removed `customerID` (non-predictive identifier)
- Encoded categorical variables using one-hot encoding
- Scaled numeric features for the model

**Model:** Logistic Regression
- **Accuracy: 81.3%**
- Precision/Recall for churned class: 68% / 58%
- Chosen over more complex models (e.g. LightGBM, decision trees) for interpretability — the coefficients directly explain *why* a customer is predicted to churn, which matters more for business decision-making than marginal accuracy gains.

## 🗄️ SQL: Churn Analysis by Segment

Six queries covering:
1. Overall churn rate
2. Churn rate by contract type
3. Churn rate by tenure bucket
4. Churn rate by payment method
5. Monthly revenue at risk
6. Churn rate by internet service type

Full queries in - Customer_Churn.sql

## 📈 Power BI: Interactive Dashboard

Built in Power BI Desktop, includes:
- **KPI summary row**: total customers, churn rate, revenue at risk, churned customers, avg. tenure of churned customers
- **Segment breakdowns**: churn rate by contract, payment method, internet service, and tenure bucket
- **Key Influencers visual**: Power BI's built-in AI independently ranks the top churn drivers — used here to cross-validate the Python model's findings without writing additional code

## 💡 Recommendations

Based on the combined analysis:
1. **Incentivize longer contracts** — the single strongest lever for reducing churn
2. **Encourage automatic payment methods** — electronic check users churn 3x more than autopay users
3. **Investigate fiber optic service quality/pricing** — fiber customers churn at more than double the DSL rate
4. **Focus retention efforts on customers in their first 5 months** — this is where churn risk is highest

## 🛠️ Tools Used
`Python` (pandas, scikit-learn) · `Oracle SQL` · `Power BI Desktop`

