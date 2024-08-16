**COVID-19 Patient Data Analysis
Overview**

This project focuses on a comprehensive analysis of COVID-19 patient data. The objective was to understand various aspects of the data, including gender distribution, age group analysis, pregnant patients, and patients with specific medical conditions. 
The analysis process involved:

**Data Cleaning and Mapping:** Performed using Excel to ensure data quality and consistency.
**SQL Queries:** Used to extract meaningful insights from the cleaned data.
**Reporting and Visualization:** Generated reports and flat files, and created interactive Tableau dashboards to support decision-making regarding COVID-19 patient management and healthcare strategies.

**SQL Queries
1. Gender Distribution**
**Objective:** Categorize patients by gender and count the number of patients in each category.

SELECT
    CASE 
        WHEN sex = 1 THEN 'Female'
        WHEN sex = 2 THEN 'Male'
        ELSE 'Other'
    END AS gender,
    COUNT(*) AS patient_count
FROM 
    dbo.project_covid_data
GROUP BY 
    CASE 
        WHEN sex = 1 THEN 'Female'
        WHEN sex = 2 THEN 'Male'
        ELSE 'Other'
    END;
    
2. **Age Group Analysis
Objective:** Analyze the count of patients in each age group, those who contracted COVID-19, and the number of deaths in each group.

SELECT 
    CASE 
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 40 THEN '18-40'
        WHEN age BETWEEN 41 AND 65 THEN '41-65'
        WHEN age > 65 THEN 'Over 65'
    END AS age_category,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN CLASIFFICATION_FINAL IN (1, 2, 3) THEN 1 ELSE 0 END) AS covid_patients,
    SUM(CASE WHEN CLASIFFICATION_FINAL IN (1, 2, 3) AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS deceased_patients
FROM 
    dbo.Project_Covid_Data
GROUP BY 
    CASE 
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 40 THEN '18-40'
        WHEN age BETWEEN 41 AND 65 THEN '41-65'
        WHEN age > 65 THEN 'Over 65'
    END;

3. **Pregnant Patients
Objective:** Determine the number of pregnant patients, those who contracted COVID-19, and the number of deaths among pregnant patients.

WITH Agecategory AS (
    SELECT AGE, DATE_DIED, CLASIFFICATION_FINAL, pregnant,
    CASE 
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 40 THEN '18-40'
        WHEN age BETWEEN 41 AND 65 THEN '41-65'
        WHEN age > 65 THEN 'Over 65'
    END AS Age_category
    FROM project_covid_data
)
SELECT Age_category,
    SUM(CASE WHEN pregnant = '1' THEN 1 ELSE 0 END) AS pregnant_patients,
    SUM(CASE WHEN pregnant = '1' AND CLASIFFICATION_FINAL IN (1, 2, 3) THEN 1 ELSE 0 END) AS covid_pregnant_patients,
    SUM(CASE WHEN pregnant = '1' AND CLASIFFICATION_FINAL IN (1, 2, 3) AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS pregnant_deaths
FROM Agecategory
WHERE pregnant = 1
GROUP BY Age_category;

4. **Patients with Specific Conditions
Objective:** Analyze patients with specific conditions (e.g., diabetes, COPD, asthma) and their outcomes related to COVID-19.

WITH Agecategory AS (
    SELECT DATE_DIED, SEX, CLASIFFICATION_FINAL, PNEUMONIA, PREGNANT, DIABETES, COPD, ASTHMA, INMSUPR, HYPERTENSION, CARDIOVASCULAR, RENAL_CHRONIC, OTHER_DISEASE, OBESITY, TOBACCO,
    CASE 
        WHEN AGE < 18 THEN '18 under'
        WHEN AGE < 41 THEN '18-40'
        WHEN AGE < 66 THEN '41-65'
        ELSE '65 over'
    END AS Age_category
    FROM dbo.Project_Covid_Data
)
SELECT Age_category, 
    CASE WHEN SEX = '1' THEN 'Female' ELSE 'Male' END AS Gender,
    COUNT(*) AS Patient_count,
    SUM(CASE WHEN PNEUMONIA = 1 THEN 1 ELSE 0 END) AS Pneumonia_Patients,
    SUM(CASE WHEN PNEUMONIA = 1 AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS Pneumonia_deaths,
    SUM(CASE WHEN PREGNANT = 1 THEN 1 ELSE 0 END) AS Pregnant_Patients,
    SUM(CASE WHEN PREGNANT = 1 AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS Pregnant_deaths,
    SUM(CASE WHEN DIABETES = 1 THEN 1 ELSE 0 END) AS Diabetes_Patients,
    SUM(CASE WHEN DIABETES = 1 AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS Diabetes_deaths,
    SUM(CASE WHEN COPD = 1 THEN 1 ELSE 0 END) AS COPD_Patients,
    SUM(CASE WHEN COPD = 1 AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS COPD_deaths,
    SUM(CASE WHEN ASTHMA = 1 THEN 1 ELSE 0 END) AS Asthma_Patients,
    SUM(CASE WHEN ASTHMA = 1 AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS Asthma_deaths,
    SUM(CASE WHEN INMSUPR = 1 THEN 1 ELSE 0 END) AS Inmsupr_Patients,
    SUM(CASE WHEN INMSUPR = 1 AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS Inmsupr_deaths,
    SUM(CASE WHEN HYPERTENSION = 1 THEN 1 ELSE 0 END) AS Hypertension_Patients,
    SUM(CASE WHEN HYPERTENSION = 1 AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS Hypertension_deaths,
    SUM(CASE WHEN CARDIOVASCULAR = 1 THEN 1 ELSE 0 END) AS Cardiovascular_Patients,
    SUM(CASE WHEN CARDIOVASCULAR = 1 AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS Cardiovascular_deaths,
    SUM(CASE WHEN RENAL_CHRONIC = 1 THEN 1 ELSE 0 END) AS Renal_chronic_Patients,
    SUM(CASE WHEN RENAL_CHRONIC = 1 AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS Renal_chronic_deaths,
    SUM(CASE WHEN OTHER_DISEASE = 1 THEN 1 ELSE 0 END) AS Other_Disease_Patients,
    SUM(CASE WHEN OTHER_DISEASE = 1 AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS Other_Disease_deaths,
    SUM(CASE WHEN OBESITY = 1 THEN 1 ELSE 0 END) AS Obesity_Patients,
    SUM(CASE WHEN OBESITY = 1 AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS Obesity_deaths,
    SUM(CASE WHEN TOBACCO = 1 THEN 1 ELSE 0 END) AS Tobacco_Patients,
    SUM(CASE WHEN TOBACCO = 1 AND DATE_DIED <> '9999-99-99' THEN 1 ELSE 0 END) AS Tobacco_deaths
FROM Agecategory
WHERE CLASIFFICATION_FINAL IN (1,2,3)
GROUP BY Age_category, SEX
ORDER BY Age_category;

Dataset
The dataset used for this analysis is available at NCBI.
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC8646298/

Usage
To run these queries, ensure that you have access to the dbo.project_covid_data table. 
The data should be cleaned and preprocessed as described in the overview before running these SQL statements. 
Adjust the queries as needed based on the actual schema and data requirements.
