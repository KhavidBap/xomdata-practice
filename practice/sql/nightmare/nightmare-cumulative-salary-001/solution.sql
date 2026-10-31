-- Xom Data · 3-month rolling payroll (excluding each employee's latest month)
-- Problem: https://xomdata.com/practice/nightmare-cumulative-salary-001
-- Solved: 2026-10-31

with groupped as (
    select id, month,
        sum(salary) over (partition by id order by month rows between 2 preceding and current row) as salary,
        row_number() over (partition by id order by month desc) as flag
    from employee
)

select id as "Id",
    month as "Month",
    salary as "Salary"
from groupped
where flag > 1
order by id, month desc
