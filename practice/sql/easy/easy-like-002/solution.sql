-- Xom Data · Sales division employees
-- Problem: https://xomdata.com/practice/easy-like-002
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select employee_code, full_name
from employees
where substr(employee_code, 1, 4) = 'SAL-'
