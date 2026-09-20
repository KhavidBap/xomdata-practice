-- Xom Data · Revenue pivoted by product type
-- Problem: https://xomdata.com/practice/hard-pivot-001
-- Solved: 2026-09-20

with filtered as (
    select strftime('%Y-%m', sale_date) as month, category, amount
    from sales
)

select month,
    sum(case when category = 'Electronics' then amount else 0 end) as electronics,
    sum(case when category = 'Clothing' then amount else 0 end) as clothing,
    sum(case when category = 'Food' then amount else 0 end) as food,
    sum(amount) as total
from filtered
group by month
order by month
