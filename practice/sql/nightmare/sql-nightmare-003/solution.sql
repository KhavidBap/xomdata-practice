-- Xom Data · 3-month consecutive disbursement rate by department
-- Problem: https://xomdata.com/practice/sql-nightmare-003
-- Solved: 2026-10-31

select b1.dept, b1.month,
    sum(b2.budget) as roll3_budget,
    sum(b2.actual) as roll3_actual,
    round(100.0 * sum(b2.actual) / nullif(sum(b2.budget), 0), 2) as utilization_pct
from budgets b1
join budgets b2 
on b2.dept = b1.dept and b2.month <= b1.month
    and b2.month >= to_char(to_date(b1.month, 'YYYY-MM') - interval '2 months', 'YYYY-MM')
group by b1.dept, b1.month
order by b1.dept, b1.month
