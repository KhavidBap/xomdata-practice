-- Xom Data · Regional payroll with shares
-- Problem: https://xomdata.com/practice/medium-winagg-010
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
select region, staff_name, salary,
    sum(salary) over (partition by region) as region_total,
    round(1.0 * salary / sum(salary) over (partition by region) * 100, 2) as pct_of_region
from payroll
order by region, salary desc, staff_name
