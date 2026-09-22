-- Xom Data · Second-highest-paid employee per department
-- Problem: https://xomdata.com/practice/expert-final-subq-003
-- Solved: 2026-09-22

with flagged as (
    select department, full_name, salary, 
        dense_rank() over (partition by department order by salary desc) as flag
    from employees
)

select department, full_name, salary
from flagged
where flag = 2
order by department, full_name
