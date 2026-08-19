-- Xom Data · Department total next to each person
-- Problem: https://xomdata.com/practice/medium-winagg-001
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
with dept as (
    select department, sum(revenue) as dept_total
    from deals
    group by department
)

select deals.department, deals.rep_name, deals.revenue, dept.dept_total
from deals
join dept on deals.department = dept.department
order by deals.department, deals.rep_name, deals.revenue
