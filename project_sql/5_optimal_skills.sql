WITH skills_demand AS (
    SELECT
        sjd.skill_id,
        sd.skills AS skill,
        COUNT(sjd.job_id) AS demand_count
    FROM job_postings_fact jpf
    JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
    JOIN skills_dim sd ON sjd.skill_id = sd.skill_id
    WHERE jpf.job_title_short = 'Data Analyst'
      AND jpf.salary_year_avg IS NOT NULL
      AND jpf.job_work_from_home = TRUE
    GROUP BY sjd.skill_id, sd.skills
    ORDER BY demand_count DESC
),
avg_salary AS (
    SELECT
        sjd.skill_id,
        ROUND(AVG(jpf.salary_year_avg), 0) AS average_salary
    FROM job_postings_fact jpf
    JOIN skills_job_dim sjd ON jpf.job_id = sjd.job_id
    WHERE jpf.job_title_short = 'Data Analyst'
      AND jpf.salary_year_avg IS NOT NULL
      AND jpf.job_work_from_home = TRUE
    GROUP BY sjd.skill_id
)
SELECT
    sd.skill_id,
    sd.skill,
    sd.demand_count,
    a.average_salary
FROM skills_demand sd
JOIN avg_salary a ON sd.skill_id = a.skill_id
where demand_count > 10 
order by demand_count desc, average_salary DESC
limit 25;