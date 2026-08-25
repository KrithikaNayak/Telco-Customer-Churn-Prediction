--Telco Customer Churn Analysis
-- SQL queries exploring churn drivers: contract type, tenure, payment method, internet service
-- Author: [Krithika A]


select * from customers 
select count(*) from customers 

#Overall churn rate
SELECT 
    Churn,
    COUNT(*) AS num_customers,
    ROUND( COUNT(*) / SUM(COUNT(*)) OVER ()*100.0, 2) AS pct_of_total
FROM customers
GROUP BY Churn;

#Churn rate by contract type
select contract ,
round(avg(churn)*100,2) as churn_rate
from customers
group by contract;

select contract , round(sum(case when churn=1 then 1 else 0 end)/count(*)*100,2) as churn_rate_pct
from customers
group by contract
order by churn_rate_pct desc ;

#Churn rate by tenure bucket
select 
    case
        when tenure<=12 then '0-12 months'
        when tenure<=24 then '13-24 months'
        when tenure<=48 then '25-48 months'
        else '48+ months'
    end as tenure_bucket,
    round(sum(case when churn =1 then 1 else 0 end )/count(*)*100,2) as churn_rate_pct
from customers
group by 
     case
         when tenure<=12 then '0-12 months'
         when tenure<=24 then '13-24 months'
         when tenure<=48 then '25-48 months'
         else '48+ months'
      end
order by tenure_bucket;

#Churn rate by payment method
SELECT 
    PaymentMethod,
    ROUND(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate_pct DESC;

#Monthly revenue at risk from churned customers
SELECT 
    ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_at_risk
FROM customers
WHERE Churn = 1;

#Churn rate by internet service type
SELECT 
    InternetService,
    ROUND(SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS churn_rate_pct
FROM customers
GROUP BY InternetService
ORDER BY churn_rate_pct DESC;




