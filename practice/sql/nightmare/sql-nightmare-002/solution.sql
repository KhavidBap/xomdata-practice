-- Xom Data · Median salary per department
-- Problem: https://xomdata.com/practice/sql-nightmare-002
-- Solved: 2026-10-05

with flagged as (
    select dept, salary,
        row_number() over (partition by dept order by salary) as flag,
        count(*) over (partition by dept) as cnt
    from employees
)

select dept,
    avg(1.0 * salary) as median_salary
from flagged
where flag in ((cnt + 1) / 2, (cnt + 2) / 2)
group by dept
order by dept
