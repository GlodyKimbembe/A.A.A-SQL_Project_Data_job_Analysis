/*
**Question: What are the most in-demand skills for Data analysts? in Belgium**

- Identify the top 5 in-demand skills for a Data analyst in belgium.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, providing insights into the most valuable skills for job seekers.
*/
Select 
  skills_dim.skills,
  COUNT(skills_job_dim.job_id) AS demand_count
FROM
  job_postings_fact
  INNER JOIN
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  -- Filters job titles for 'Data Analyst' roles
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%Belgium%'  
	-- AND job_work_from_home = True -- optional to filter for remote jobs
GROUP BY
  skills_dim.skills
ORDER BY
  demand_count DESC
LIMIT 20;
