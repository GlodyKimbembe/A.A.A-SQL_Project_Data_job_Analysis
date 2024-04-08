/*
**Question: What are the top-paying data analyst jobs, and what skills are required?** 

- Identify the top 10 highest-paying Data Analyst jobs and the specific skills required for these roles.
- Filters for roles with specified salaries that are remote
- Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS ( 
Select 
    job_id,
    job_title_short,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM    
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    Job_title_short = 'Data Analyst' AND
    job_location = '' AND
    salary_year_avg is NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10
)
SELECT 
top_paying_jobs.*,
skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs. job_id = skills_job_dim. job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    Salary_year_avg DESC;