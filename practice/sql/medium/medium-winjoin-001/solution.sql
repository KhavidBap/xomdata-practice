-- Xom Data · Sales rankings with department names
-- Problem: https://xomdata.com/practice/medium-winjoin-001
-- Solved: 2026-09-16

-- Write your SQL here
select dept_name, 
    rank() over (partition by dept_name order by sales_amount desc) as dept_rank,
    staff_name, sales_amount
from staff
join departments on departments.id = staff.dept_id
order by dept_name, dept_rank, staff_name
