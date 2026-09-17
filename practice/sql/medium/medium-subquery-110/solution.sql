-- Xom Data · Employees paid above their department average
-- Problem: https://xomdata.com/practice/medium-subquery-110
-- Solved: 2026-09-17

with avg_salary as (
    select department_id, dept_name, round(avg(salary), 0) as dept_avg_salary
    from employees
    join departments on department_id = departments.id
    group by department_id
)

--select * from avg_salary

select full_name, dept_name, salary, dept_avg_salary,
    round(1.0 * (salary - dept_avg_salary) / dept_avg_salary * 100, 2) as premium_pct
from employees
join avg_salary using (department_id)
where salary > dept_avg_salary
order by premium_pct desc, dept_name, full_name
