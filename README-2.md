**Loan and Property Data Analysis**

**Overview**
This project involves analyzing loan and property data from the sonyma_target_tz table to gain insights into loan totals, property values, and associated locations. 
The following SQL queries are included to generate reports on annual loan totals, expensive counties, high-value zip codes, and property values by type.

1. Calculate the Loan Total for Each Year
Objective: Calculate the total loan amount for each year.

SELECT 
    CAST(SUM(orig_loan_amount) AS DECIMAL(19,2)) AS loan_total, 
    purchase_year 
FROM 
    sonyma_target_tz
GROUP BY 
    purchase_year
ORDER BY 
    loan_total DESC;

2. Identify the County with the Most Expensive Loan Total
Objective: Identify the counties with the highest total loan amounts.

SELECT TOP 10 
    CAST(SUM(orig_loan_amount) AS DECIMAL(19,2)) AS loan_total, 
    county
FROM 
    sonyma_target_tz
GROUP BY 
    county
ORDER BY 
    loan_total DESC;

3. Identify the Zip Code(s) Associated with Expensive Houses
Objective: Identify zip codes associated with higher property values.

SELECT TOP 10 
    CAST((orig_loan_amount / orig_loan_to_value * 100) AS DECIMAL(19,2)) AS property_value, 
    fips_code, 
    county
FROM 
    sonyma_target_tz
ORDER BY 
    property_value DESC;

4. Calculate Each Property Type's Maximum, Minimum, and Average Property Values
Objective: Calculate the maximum, minimum, and average property values for each property type.

SELECT 
    CAST(MAX(orig_loan_amount / orig_loan_to_value * 100) AS DECIMAL(19,2)) AS max_value,
    CAST(MIN(orig_loan_amount / orig_loan_to_value * 100) AS DECIMAL(19,2)) AS min_value,
    CAST(AVG(orig_loan_amount / orig_loan_to_value * 100) AS DECIMAL(19,2)) AS avg_value,
    property_type
FROM 
    sonyma_target_tz
GROUP BY 
    property_type
ORDER BY 
    max_value DESC;

**Usage
To utilize these queries:**

**Adapt Queries:** Ensure the queries are compatible with your database schema and table names if necessary.
**Execute Queries:** Run these queries in your SQL client or database management tool to obtain the respective reports.

**Confidentiality Notice**
The data used in these queries is **confidential.** Please ensure that access to this data is restricted and that it is not shared or distributed without proper authorization.
