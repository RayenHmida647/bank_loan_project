-- 1. Total Loan Applications
SELECT COUNT(id) AS total_loan_applications FROM bank_loan_data;

-- 2. MTD Loan Applications
SELECT COUNT(id) AS MTD_total_loan_applications FROM bank_loan_data WHERE MONTH(issue_date) = 12;

-- 3. PMTD Loan Applications
SELECT COUNT(id) AS Total_Applications FROM bank_loan_data WHERE MONTH(issue_date) = 11;

-- 4. Total Funded Amount
SELECT SUM(loan_amount) AS total_funded_amount FROM bank_loan_data;

-- 5. MTD Total Funded Amount
SELECT SUM(loan_amount) AS MTD_total_funded_amount FROM bank_loan_data WHERE MONTH(issue_date) = 12;

-- 6. PMTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data WHERE MONTH(issue_date) = 11;

-- 7. Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data;

-- 8. MTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data WHERE MONTH(issue_date) = 12;

-- 9. PMTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data WHERE MONTH(issue_date) = 11;

-- 10. Average Interest Rate
SELECT AVG(int_rate) * 100 AS Avg_Int_Rate FROM bank_loan_data;

-- 11. MTD Average Interest Rate
SELECT AVG(int_rate) * 100 AS MTD_Avg_Int_Rate FROM bank_loan_data WHERE MONTH(issue_date) = 12;

-- 12. PMTD Average Interest Rate
SELECT AVG(int_rate) * 100 AS MTD_Avg_Int_Rate FROM bank_loan_data WHERE MONTH(issue_date) = 11;

-- 13. Average DTI (Debt-to-Income)
SELECT AVG(dti) * 100 AS Avg_DTI FROM bank_loan_data;

-- 14. PMTD Average DTI
SELECT AVG(dti) * 100 AS PMTD_Avg_DTI FROM bank_loan_data WHERE MONTH(issue_date) = 11;

-- 15. Good Loan Percentage
SELECT (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / COUNT(id) AS Good_Loan_Percentage FROM bank_loan_data;

-- 16. Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- 17. Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan_data WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- 18. Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan_data WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- 19. Bad Loan Percentage
SELECT (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / COUNT(id) AS Bad_Loan_Percentage FROM bank_loan_data;

-- 20. Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data WHERE loan_status = 'Charged Off';

-- 21. Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data WHERE loan_status = 'Charged Off';

-- 22. Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data WHERE loan_status = 'Charged Off';

-- 23. Loan Status Summary
SELECT
    loan_status,
    COUNT(id) AS LoanCount,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM bank_loan_data
GROUP BY loan_status;

-- 24. MTD Loan Status Summary
SELECT
    loan_status,
    SUM(total_payment) AS MTD_Total_Amount_Received,
    SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status;

-- 25. Monthly Overview
SELECT
    MONTH(issue_date) AS Month_Number,
    MONTHNAME(issue_date) AS Month_name,
    COUNT(id) AS Total_loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);

-- 26. State-wise Loan Summary
SELECT
    state,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY state;

-- 27. Term-wise Loan Summary
SELECT
    term AS Term,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term;

-- 28. Employee Length-wise Loan Summary
SELECT
    emp_length AS Employee_Length,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;

-- 29. Purpose-wise Loan Summary
SELECT
    purpose,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose;

-- 30. Home Ownership-wise Loan Summary
SELECT
    home_ownership AS Home_Ownership,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership;