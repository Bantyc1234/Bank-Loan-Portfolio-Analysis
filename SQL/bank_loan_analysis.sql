-- =====================================================
-- BANK LOAN PORTFOLIO ANALYSIS
-- Tool: MySQL
-- =====================================================

-- Start Analysis -- 

select *
from financial_loan;

-- Check Duplicate Id --
SELECT 
    id,
    COUNT(*) AS duplicate_count
FROM financial_loan
GROUP BY id
HAVING COUNT(*) > 1;


 -- Describe Data Type and Null & Key Type --
 describe financial_loan;

 -- Top 10 Highest Loan Approved Candidate/Client
 
 SELECT *
 FROM financial_loan
 ORDER BY loan_amount DESC
limit 10;

-- Total amount of loan disbursed by the bank? --
SELECT SUM(loan_amount) as total_loan_amount
from financial_loan; -- 43,57,57,075 --

-- Average Loan amount -- 
select AVG(loan_amount) as average_loan_amount
from financial_loan;  -- 11296 --

-- Minimum and Maximum Loan Amount --
SELECT
    MIN(loan_amount) AS minimum_loan, -- 500 --
    MAX(loan_amount) AS maximum_loan  -- 35000 --
FROM financial_loan;

 -- Customer Analysis --
 select avg(annual_income) as average_income -- 69644.54 --
 from financial_loan;
 
 -- Minimum and Maximum Salary in Customer -- 
 SELECT
    MIN(annual_income) AS minimum_income,  -- 4000 --
    MAX(annual_income) AS maximum_income	-- 6000000 --
FROM financial_loan;


-- Interest rate analysis --
SELECT
    MIN(int_rate) AS minimum_interest_rate,
    MAX(int_rate) AS maximum_interest_rate,
    AVG(int_rate) AS average_interest_rate
FROM financial_loan;
    
-- Loan status analysis --
select 
	loan_status,
    count(*) as loan_count
from financial_loan  -- Fully Paid - 32145 -- 
group by loan_status  -- Current - 5333 -- 
order by loan_count desc;    -- Current - 1098 -- 


 -- Convert loan_status Percantage -- 
 select 
	loan_status,
	count(*) as loan_count,
    Round(
		count(*) * 100.0 / SUM(count(*)) Over(),
        2
	) AS Percentage
    from financial_loan
    group by loan_status
    order by loan_status DESC;
    
    
-- which Purpose gets the most loans? --

select 
	purpose,
	count(*) as loan_count
from financial_loan
group by purpose
order by loan_count desc;
    

 -- Grade Analysis --
SELECT 
	grade,
    count(*) as loan_count,
    SUM(loan_amount) as total_loan_amount,
    AVG(int_rate) as avg_interest_rate
from financial_loan
group by grade
order by grade;
        

-- Grade vs Loan Status -- 
select 
	grade,
    loan_status,
    count(*) as loan_count
from financial_loan
group by grade, loan_status
order by grade, loan_status;  


--  which states have the most loans -- 

 SELECT
    address_state,
    COUNT(*) AS loan_count,
    SUM(loan_amount) AS total_loan_amount,
    AVG(loan_amount) AS avg_loan_amount
FROM financial_loan
GROUP BY address_state
ORDER BY total_loan_amount DESC;


-- Home Ownership analysis -- 

select 
	home_ownership,
    count(*) as loan_count,
    Sum(loan_amount) as total_loan_amount,
    avg(loan_amount) as avg_loan_amount
from financial_loan
group by home_ownership
order by loan_count desc;    

-- Employment length --

select
	emp_length,
    count(*) as loan_count
from financial_loan
group by emp_length
order by loan_count desc;    


-- Monthly Loan trend Time series Analysis -- 

SELECT
    YEAR(issue_date) AS year,
    MONTH(issue_date) AS month,
    COUNT(*) AS loan_count,
    SUM(loan_amount) AS total_loan_amount
FROM financial_loan
GROUP BY
    YEAR(issue_date),
    MONTH(issue_date)
ORDER BY
    year,
    month;    


-- Dashboard Style Summary --

select
	count(*) as total_loans,
    sum(loan_amount) as total_funded_amount,
    avg(loan_amount) as avg_loan_amount,
    avg(int_rate) as avg_interest_rate,
    avg(dti) as avg_dti,
    Sum(total_payment) as total_payment_received
from financial_loan;

-- We will importatn Column so Check Null Value -- 
SELECT
    SUM(CASE WHEN annual_income IS NULL THEN 1 ELSE 0 END) AS missing_income,
    SUM(CASE WHEN loan_amount IS NULL THEN 1 ELSE 0 END) AS missing_loan_amount,
    SUM(CASE WHEN int_rate IS NULL THEN 1 ELSE 0 END) AS missing_interest_rate,
    SUM(CASE WHEN dti IS NULL THEN 1 ELSE 0 END) AS missing_dti
FROM financial_loan;
    
-- Loan to Income Ratio --
select
	id,
    loan_amount,
    annual_income,
    round(loan_amount / annual_income, 2) as loan_to_income
from financial_loan;    

-- Payment Above Principal -- 
select
	id,
    loan_amount,
    total_payment,
    total_payment - loan_amount as payment_above_principal
from financial_loan;
    
    
  SELECT
    id,
    loan_amount,
    annual_income,
    dti,
    grade,

    ROUND(
        loan_amount / NULLIF(annual_income, 0),
        2
    ) AS loan_to_income_ratio,

    CASE
        WHEN dti < 15 THEN 'Low DTI'
        WHEN dti < 25 THEN 'Medium DTI'
        ELSE 'High DTI'
    END AS dti_category,

    CASE
        WHEN loan_amount < 10000 THEN 'Small Loan'
        WHEN loan_amount < 25000 THEN 'Medium Loan'
        ELSE 'Large Loan'
    END AS loan_category

FROM financial_loan;

-- Charge-Off Rate by Grade -- 

SELECT
    grade,

    COUNT(*) AS total_loans,

    SUM(
        CASE
            WHEN loan_status = 'Charged Off'
            THEN 1
            ELSE 0
        END
    ) AS charged_off_loans,

    ROUND(
        SUM(
            CASE
                WHEN loan_status = 'Charged Off'
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS charge_off_rate

FROM financial_loan

GROUP BY grade

ORDER BY grade;

  -- Total Loan Application -- 
 describe financial_loan;