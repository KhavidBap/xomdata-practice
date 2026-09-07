-- Xom Data · Salary bands within each department
-- Problem: https://xomdata.com/practice/medium-denserank-002
-- Solved: 2026-09-07

-- Viết SQL của bạn ở đây
select department, 
    dense_rank() over (partition by department order by salary desc) as salary_tier,
    full_name, salary
from employees
order by department, salary_tier, full_name
