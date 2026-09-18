-- Xom Data · Employees averaging over 5 overtime hours
-- Problem: https://xomdata.com/practice/medium-having-128
-- Solved: 2026-09-18

with employee as (
    select employee_id, month, work_days, overtime_hours, net_salary
    from attendance
    join payroll using (employee_id, month)
), joined as (
    select *
    from employees
    join employee on employee_id = employees.id
)

select full_name, employee_code,
    avg(work_days) as avg_work_days,
    avg(overtime_hours) as avg_overtime_hours,
    avg(net_salary) as avg_salary,
    round(1.0 * avg(overtime_hours) / avg(work_days), 4) as overtime_intensity,
    rank() over (order by 1.0 * avg(overtime_hours) / avg(work_days) desc) as intensity_rank,
    ntile(4) over (order by 1.0 * avg(overtime_hours) / avg(work_days) desc) as workload_quartile
from joined
group by full_name
having avg_overtime_hours > 5 and avg_work_days >= 18
