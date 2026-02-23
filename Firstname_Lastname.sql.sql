USE capstone;
SELECT * FROM dept;
SELECT * FROM office_employees;
SELECT * FROM office_countries;
SELECT * FROM office_jobs;

DELIMITER $$
CREATE PROCEDURE Capstone_project()
BEGIN
SELECT * FROM dept;
SELECT * FROM office_employees;
SELECT * FROM office_countries;
SELECT * FROM office_jobs;
END $$
DELIMITER ;

CALL capstone_project;

-- How many employees are in each department, and which department has the highest headcount?--

SELECT d.department_name, COUNT(em.employee_id) AS Number_of_employees FROM office_employees AS em
INNER JOIN dept AS d
ON em.department_id = d.department_id
GROUP BY D.department_name
ORDER BY Number_of_employees DESC
LIMIT 1;

-- What is the average salary per department, and which department has the highest and lowest average salaries? --
SELECT dt.department_name, ROUND(AVG(oe.salary),0) AS Avg_Salary 
FROM dept AS dt
INNER JOIN office_employees AS oe
ON dt.department_id = oe.department_id
GROUP BY  dt.department_name
ORDER BY Avg_salary DESC;
-- Executive department has the highest average salary and Shipping has the Lowest Salary --

-- Classify employees into three salary bands using CASE: --
SELECT 
CASE 
WHEN salary < 5000 THEN 'Low'
WHEN salary BETWEEN 5000 AND 10000 THEN 'Medium'
ELSE 'High'
END AS Salary_Band,
COUNT(*) AS Total_Employees
FROM office_employees
GROUP BY salary_band;

-- List all countries in which Orion Data Systems operates. For each country, show the number of departments located there. --
	SELECT ct.country_name, COUNT(em.department_id) AS no_of_dept  
    FROM office_countries AS ct
    INNER JOIN office_employees AS em
    ON ct.country_id = em.country_id
    GROUP BY ct.country_name;
    
    -- Find all employees whose salaries are greater than the company-wide average salary.--
    SELECT ROUND(AVG(salary),0) AS Avg_Salary 
    FROM office_employees;
    
    SELECT emp_name,salary FROM office_employees
    WHERE salary > (SELECT ROUND(AVG(salary),0) AS Avg_Salary 
    FROM office_employees);
    
    -- For each job title, calculate the average salary. Then, identify job titles where the average salary is above 12,000. --
 WITH Avg_job_title AS (   
SELECT job_title, ROUND(AVG(salary),0) AS Avg_salary
FROM office_jobs AS jb
INNER JOIN office_employees AS oe
ON jb.job_id = oe.job_id
GROUP BY job_title
HAVING Avg_salary > 12000)
SELECT * FROM Avg_job_title;

-- Calculate the total salaries paid to employees in each country. List the country name alongside the total salary cost, ordered from highest to lowest.
SELECT co.country_name, SUM(em.salary) AS Total_salaries
FROM office_employees AS em
INNER JOIN office_countries AS co
ON em.country_id = co.country_id
GROUP BY country_name
ORDER BY Total_salaries DESC;

-- Identify all job roles in the company (jobs table) that currently have no employees assigned. --
SELECT jb.job_title, em.emp_name FROM office_employees AS em
INNER JOIN office_jobs AS jb
ON em.job_id = jb.job_id
WHERE emp_name IS NULL;