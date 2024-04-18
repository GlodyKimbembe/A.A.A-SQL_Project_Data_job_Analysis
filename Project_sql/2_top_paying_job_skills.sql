

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
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%Belgium%' AND
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
