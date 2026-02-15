/*	•	Get the corresponding skill and 
skill type for each job posting in Q1
	•	Include those without any skills, too
	•	Why? Look at the skills and the type v
    for each job in the first quarter that has a 
    salary > $70,000*/
with skills as (
    select job_id from skills_job_dim
)
select job_title_short, skills, type from job_postings_fact left join skills_job_dim
on job_postings_fact.job_id = skills_job_dim.job_id inner join skills_dim on skills_dim.skill_id = skills_job_dim.skill_id where salary_year_avg > 70000;