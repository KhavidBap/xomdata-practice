-- Xom Data · Sales champion of each region
-- Problem: https://xomdata.com/practice/medium-topn-001
-- Solved: 2026-08-25

-- Viết SQL của bạn ở đây
with thang as (
    select region, rep_name, sales_amount, 
        row_number() over (partition by region order by sales_amount desc, rep_name) as flag
    from reps
)

select region, rep_name, sales_amount
from thang
where flag = 1
order by region
