-- Xom Data · Salary by department and title
-- Problem: https://xomdata.com/practice/medium-join-126
-- Solved: 2026-08-26

with info as (
    select e.id, d.department_name, p.position_name, pa.net_salary as salary
    from employees e
    join departments d on d.id = e.department_id
    join positions p on p.id = e.position_id
    join payroll pa on e.id = pa.employee_id
), grouped as (
    select department_name, position_name, count(id) as employee_count,
        avg(salary) as avg_salary, min(salary) as min_salary, max(salary) as max_salary,
        max(salary) - min(salary) as salary_spread
    from info
    group by department_name, position_name
)

select department_name, position_name, employee_count, avg_salary, min_salary, max_salary, salary_spread,
    rank() over (partition by department_name order by avg_salary desc) as rank_in_dept
from grouped
order by department_name, rank_in_dept, position_name
