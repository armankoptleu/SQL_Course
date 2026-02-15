SELECT
    job_id,
    job_title, 
    job_location, 
    job_schedule_type, 
    salary_year_avg,
    job_posted_date
from job_postings_fact
where job_title_short = 'Data Analyst' 
and job_location = 'anywhere'
and salary_year_avg is not null;