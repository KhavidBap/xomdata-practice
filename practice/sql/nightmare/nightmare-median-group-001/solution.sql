-- Xom Data · Median department salary
-- Problem: https://xomdata.com/practice/nightmare-median-group-001
-- Solved: 2026-10-05

with flagged as (
    select department, salary,
        row_number() over (partition by department order by salary) as flag,
        count(*) over (partition by department) as cnt
    from employees
)

select department,
    avg(1.0 * salary) as median_salary
from flagged
where flag in ((cnt + 1) / 2, (cnt + 2) / 2)
group by department
order by department
