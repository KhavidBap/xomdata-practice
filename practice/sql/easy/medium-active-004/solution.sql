-- Xom Data · Who stayed loyal all quarter
-- Problem: https://xomdata.com/practice/medium-active-004
-- Solved: 2026-09-10

with extracted_month as (
    select customer_id, strftime('%m-%Y', order_date) as order_month
    from orders
), grouped as (
    select customer_id, 
        sum(case when order_month = '01-2024' then 1 else 0 end) as jan,
        sum(case when order_month = '02-2024' then 1 else 0 end) as feb,
        sum(case when order_month = '03-2024' then 1 else 0 end) as mar
    from extracted_month
    group by customer_id
)

select customer_id
from grouped
where jan >= 1 and feb >= 1 and mar >= 1
