SELECT * FROM [Bank Loan DB].[dbo].[bank_loan_data];

--Total Loan Applications
SELECT distinct count(id) AS Total_Loan_Application FROM [Bank Loan DB].[dbo].[bank_loan_data];

--MTD Loan Applications 
SELECT count(id) AS MTD_Total_Loan_Application FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE MONTH(issue_date)=12 AND YEAR(issue_date) = 2021;

--PMTD Loan Applications
SELECT count(id) AS PMTD_Total_Loan_Application FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE MONTH(issue_date)=11 AND YEAR(issue_date) = 2021;

--MTD-PMTD/PMTD = MOM% 

--Total Funded Amount
SELECT SUM(loan_amount) AS Toal_Funded_Amount FROM [Bank Loan DB].[dbo].[bank_loan_data];

--MTD Funded Amount
SELECT SUM(loan_amount) AS MTD_Toal_Funded_Amount FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE MONTH(issue_date)=12 AND YEAR(issue_date) = 2021;

--PMTD Funded Amount
SELECT SUM(loan_amount) AS PMTD_Toal_Funded_Amount FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE MONTH(issue_date)=11 AND YEAR(issue_date) = 2021;

--Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Received FROM [Bank Loan DB].[dbo].[bank_loan_data];

--MTD Total Amount Received
SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE MONTH(issue_date)=12 AND YEAR(issue_date) = 2021;

--PMTD Total Amount Received
SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE MONTH(issue_date)=11 AND YEAR(issue_date) = 2021;

--AVG Interest Rate
SELECT Round(AVG(int_rate)*100, 2) AS AVG_Interest_Rate FROM [Bank Loan DB].[dbo].[bank_loan_data];

--MTD AVG Interest Rate
SELECT Round(AVG(int_rate)*100, 2) AS MTD_AVG_Interest_Rate FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE MONTH(issue_date)=12 AND YEAR(issue_date) = 2021;

--PMTD AVG Interest Rate
SELECT Round(AVG(int_rate)*100, 2) AS PMTD_AVG_Interest_Rate FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE MONTH(issue_date)=11 AND YEAR(issue_date) = 2021;

-- AVG DTI (debt to income) 
SELECT ROUND(AVG(dti)*100, 2) AS AVG_DTI from [Bank Loan DB].[dbo].[bank_loan_data];

--MTD AVG DTI 
SELECT ROUND(AVG(dti)*100, 2) AS MTD_AVG_DTI from [Bank Loan DB].[dbo].[bank_loan_data]
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

--PMTD AVG DTI 
SELECT ROUND(AVG(dti)*100, 2) AS PMTD_AVG_DTI from [Bank Loan DB].[dbo].[bank_loan_data]
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;


--- END of KPI's ---

-- Good Loan Percentage 
SELECT 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
	/
	COUNT (id) AS Good_Loan_Percentage 
FROM [Bank Loan DB].[dbo].[bank_loan_data];


-- Total Good Loan Application
SELECT COUNT(id) AS Good_Loan_Application
FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';


--Good Loan Funded Amount 
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount 
FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';


-- Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_Amount_Received
FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';


-- Bad Loan Percentage 
SELECT 
	cast(
		ROUND(
			(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.00)
			/
			COUNT (id),
			2) AS DECIMAL(5,2)) 
			AS Bad_Loan_Percentage
FROM [Bank Loan DB].[dbo].[bank_loan_data];


-- Total Bad Loan Application
SELECT COUNT(id) AS Bad_Loan_Application
FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE loan_status = 'Charged Off';


--Bad Loan Funded Amount 
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount 
FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE loan_status = 'Charged Off';

-- Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_Amount_Received
FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE loan_status = 'Charged Off';


--Loan Status Summary 
SELECT 
	loan_status,
	COUNT(id) AS Total_Loan_Application,
	SUM (total_payment) AS Total_Amount_Received,
	SUM (loan_amount) AS Total_Funded_Amount,
	ROUND(AVG (int_rate)*100, 2) AS Interest_Rate,
	ROUND(AVG (dti)*100, 2) AS DTI
FROM [Bank Loan DB].[dbo].[bank_loan_data]
Group by loan_status;


-- MTD Funded and Received Amount Summary 
SELECT 
	loan_status,
	SUM(loan_amount) AS MTD_Toal_Funded_Amount,
	SUM (total_payment) AS MTD_Total_Amount_Received
FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE MONTH(issue_date)=12 AND YEAR(issue_date) = 2021
Group By loan_status;


-- PMTD Funded and Received Amount Summary 
SELECT 
	loan_status,
	SUM(loan_amount) AS PMTD_Toal_Funded_Amount,
	SUM (total_payment) AS PMTD_Total_Amount_Received
FROM [Bank Loan DB].[dbo].[bank_loan_data]
WHERE MONTH(issue_date)=11 AND YEAR(issue_date) = 2021
Group By loan_status;


--- Loan Summary on Month Basis
SELECT
	MONTH(issue_date) AS Month_Number,
	DATENAME(MONTH, issue_date) AS Month_Name, 
	COUNT (id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan DB].[dbo].[bank_loan_data]
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date);


--- Loan Summary on State Basis
SELECT
	address_state,
	COUNT (id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan DB].[dbo].[bank_loan_data]
GROUP BY address_state
ORDER BY COUNT (id) DESC;


--- Loan Summary on Term length Basis
SELECT
	term,
	COUNT (id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan DB].[dbo].[bank_loan_data]
GROUP BY term
ORDER BY term;


--- Loan Summary on Employment length Basis
SELECT
	emp_length,
	COUNT (id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan DB].[dbo].[bank_loan_data]
GROUP BY emp_length
ORDER BY COUNT (id) DESC;


--- Loan Summary on Purpose of Loan Basis
SELECT
	purpose,
	COUNT (id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan DB].[dbo].[bank_loan_data]
GROUP BY purpose
ORDER BY COUNT (id) DESC;


--- Loan Summary on Home Ownership Basis
SELECT
	home_ownership,
	COUNT (id) AS Total_Loan_Application,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM [Bank Loan DB].[dbo].[bank_loan_data]
GROUP BY home_ownership
ORDER BY COUNT (id) DESC;