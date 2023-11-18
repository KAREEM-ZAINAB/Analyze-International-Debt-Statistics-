--Finding the number of distinct countries
SELECT COUNT(DISTINCT country_name) AS total_distinct_countries
FROM international_debt;


--Finding out the distinct debt indicators
SELECT DISTINCT indicator_code AS distinct_debt_indicators
FROM international_debt
ORDER BY distinct_debt_indicators DESC ;

--Totaling the amount of debt owed by countries
SELECT ROUND(SUM(debt)/1000000,2)  AS total_debt 
FROM international_debt;

--Average amount of deby across indicators
SELECT indicator_code AS debt_indicator, indicator_name, AVG(debt) AS average_debt 
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC 
LIMIT 10;

--The highest amount of principal repayments
SELECT 
    country_name, 
    indicator_name
FROM international_debt
WHERE debt = (SELECT 
                 MAX(debt)
             FROM international_debt
             WHERE indicator_code = 'DT.AMT.DLXF.CD');