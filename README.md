# Orion Data Systems Workforce Analytics Report
Analyzing HR workforce data using MySQL to support staffing, compensation, and global workforce planning.

![MySQL Preview](MySQL-image.png)

## Executive Summary
- Orion Data Systems’ HR team lacked a centralized analytical view of workforce distribution, salary structure, and geographical staffing patterns across departments and job roles.
- Using MySQL, workforce data from multiple tables was integrated to generate actionable HR insights. The analysis examined employee distribution, salary trends, job role value, and country-level workforce costs.
- The results identified the department with the highest headcount, revealed significant salary differences across departments, classified employees into salary bands, and highlighted high-paying job roles. Additionally, the analysis showed countries with the highest salary expenditure and identified gaps in job-role staffing.

## The Business Problem
Orion Data Systems required a structured, data-driven understanding of its workforce to support HR strategy and organizational planning.

The stakeholders’ objective was to move from raw employee records to meaningful insights that answer key workforce questions.

## The Process (Methodology)
### Tools Used
MySQL, SQL (JOIN, GROUP BY, CASE, CTE, Subqueries, Aggregate Functions)

### Data Sourcing & Overview
The dataset consists of four relational tables:
- office_employees – employee details, salary, department, job, and country
- dept – department information
- office_jobs – job titles and salary ranges
- office_countries – country names and regions

### Data Preparation
- Activated the working schema using USE capstone
- Previewed all tables using SELECT *
- Created a stored procedure to access all tables efficiently
- Established relationships using department_id, job_id, and country_id











### Key Questions Addressed
- How are employees distributed across departments?
- Which departments have the highest and lowest average salaries?
- What is the salary structure of the organization?
- Which countries have the highest workforce cost?
- Which employees earn above the company average?
- Which job roles are high-paying or currently unfilled?
