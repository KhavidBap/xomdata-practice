-- Xom Data · Above or below the department norm
-- Problem: https://xomdata.com/practice/medium-winagg-007
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
with grouped as (
    select department, avg(salary) as avg_salary
    from employees
    group by department
)

select e.department, e.full_name, e.salary,
    case when e.salary > g.avg_salary then "Above"
    when e.salary = g.avg_salary then "Equal"
    else "Below" end as position_label
from employees e
join grouped g on e.department = g.department
order by e.department, e.full_name
