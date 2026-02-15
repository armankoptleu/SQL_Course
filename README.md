# SQL Project — Job Market Analysis (Data Analyst)

## Introduction
This repository contains a set of SQL queries used to analyze the job market for **Data Analyst** roles:
- top paying jobs
- skills required for top paying roles
- most demanded skills
- top paying skills
- optimal skills (high demand + high salary)

## Background
The analysis is based on job postings data stored in tables:
- `job_postings_fact`
- `company_dim`
- `skills_dim`
- `skills_job_dim`

Filters commonly used in queries:
- `job_title_short = 'Data Analyst'`
- `salary_year_avg IS NOT NULL`
- `job_work_from_home = TRUE` (for remote-only analysis)

## Tools I Used
- SQL (CTEs, JOINs, aggregation, filtering, ordering)
- VS Code + SQLTools / SQLite (or PostgreSQL)
- Git & GitHub (version control)

## The Analysis
### 1) Top paying Data Analyst jobs
**File:** `project_sql/1_top_paying_jobs.sql`  
Goal: Find the highest paying Data Analyst job postings.

### 2) Skills for top paying jobs
**File:** `project_sql/2_top_paying_job_skills.sql`  
Goal: Identify which skills appear in the highest paying roles.

### 3) Most demanded skills
**File:** `project_sql/3_top_demanded_skills.sql`  
Goal: Rank skills by frequency across Data Analyst postings.

### 4) Top paying skills
**File:** `project_sql/4_top_paying_skills.sql`  
Goal: Rank skills by highest average salary.

### 5) Optimal skills (demand + salary)
**File:** `project_sql/5_optimal_skills.sql`  
Goal: Find skills that are both highly demanded and high-paying.

## What I Learned
- How to use **CTEs** to structure analysis
- How to combine multiple tables with **JOINs**
- How to compute metrics like:
  - demand count (frequency)
  - average salary per skill
- How filter choices (remote-only, salary not null) change results

## Conclusions
- Certain skills consistently correlate with higher salaries
- Remote Data Analyst roles have different skill demand patterns
- “Optimal skills” give the best direction for what to learn next

---

## How to Run
1. Load the CSV data into your database (SQLite/PostgreSQL).
2. Run each query file in order from the `project_sql/` folder.

Example quick checks:
```sql
SELECT COUNT(*) FROM job_postings_fact;
SELECT * FROM job_postings_fact LIMIT 5;
