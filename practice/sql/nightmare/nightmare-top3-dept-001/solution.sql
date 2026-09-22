-- Xom Data · Top 3 salaries per department
-- Problem: https://xomdata.com/practice/nightmare-top3-dept-001
-- Solved: 2026-09-22

with flagged as (
    select name as Employee, salary as Salary, departmentId,
        dense_rank() over (partition by departmentId order by salary desc) as flag
    from Employee
)

select Department.name as Department, Employee, Salary
from flagged
join Department on departmentId = Department.id
where flag <= 3
order by Department, Salary desc, Employee
