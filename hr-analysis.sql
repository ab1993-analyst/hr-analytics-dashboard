/*
HR ANALYTICS DASHBOARD: EMPLOYEE ATTRITION & PERFORMANCE ANALYSIS

Objective:
Analyze employee attrition, salary trends, and performance metrics
to identify workforce patterns and support HR decision-making.

Author: Ahmed Basheer
*/

-- =====================================================
-- 1. TOTAL EMPLOYEE ATTRITION OVERVIEW
-- =====================================================

SELECT
    Attrition,
    COUNT(*) AS total_employees
FROM `hr-analytic.hr_analytics.employees`
GROUP BY Attrition;


-- =====================================================
-- 2. ATTRITION BY DEPARTMENT
-- =====================================================

SELECT
    Department,
    COUNT(*) AS attrition_count
FROM `hr-analytic.hr_analytics.employees`
WHERE Attrition = TRUE
GROUP BY Department
ORDER BY attrition_count DESC;


-- =====================================================
-- 3. AVERAGE SALARY BY DEPARTMENT
-- =====================================================

SELECT
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS avg_salary
FROM `hr-analytic.hr_analytics.employees`
GROUP BY Department
ORDER BY avg_salary DESC;


-- =====================================================
-- 4. SALARY VS PERFORMANCE RATING
-- =====================================================

SELECT
    PerformanceRating,
    ROUND(AVG(MonthlyIncome), 2) AS avg_salary
FROM `hr-analytic.hr_analytics.employees`
GROUP BY PerformanceRating
ORDER BY PerformanceRating;


-- =====================================================
-- 5. ATTRITION BY SALARY BAND
-- =====================================================

SELECT
    CASE
        WHEN MonthlyIncome < 4000 THEN 'Low Salary'
        WHEN MonthlyIncome BETWEEN 4000 AND 8000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS salary_band,

    COUNT(*) AS employees_left

FROM `hr-analytic.hr_analytics.employees`

WHERE Attrition = TRUE

GROUP BY salary_band
ORDER BY employees_left DESC;


-- =====================================================
-- 6. AVERAGE YEARS AT COMPANY
-- =====================================================

SELECT
    Attrition,
    ROUND(AVG(YearsAtCompany), 2) AS avg_years
FROM `hr-analytic.hr_analytics.employees`
GROUP BY Attrition;


-- =====================================================
-- 7. ATTRITION BY JOB ROLE
-- =====================================================

SELECT
    JobRole,
    COUNT(*) AS employees_left
FROM `hr-analytic.hr_analytics.employees`
WHERE Attrition = TRUE
GROUP BY JobRole
ORDER BY employees_left DESC;


-- =====================================================
-- 8. AVERAGE SALARY BY JOB ROLE
-- =====================================================

SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) AS avg_salary
FROM `hr-analytic.hr_analytics.employees`
GROUP BY JobRole
ORDER BY avg_salary DESC;


-- =====================================================
-- 9. OVERTIME VS ATTRITION
-- =====================================================

SELECT
    OverTime,
    COUNT(*) AS attrition_count
FROM `hr-analytic.hr_analytics.employees`
WHERE Attrition = TRUE
GROUP BY OverTime;


-- =====================================================
-- 10. WORK-LIFE BALANCE ANALYSIS
-- =====================================================

SELECT
    WorkLifeBalance,
    COUNT(*) AS employee_count
FROM `hr-analytic.hr_analytics.employees`
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;
