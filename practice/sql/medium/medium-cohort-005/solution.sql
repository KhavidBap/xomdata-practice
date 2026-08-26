-- Xom Data · Each customer's starting quarter
-- Problem: https://xomdata.com/practice/medium-cohort-005
-- Solved: 2026-08-26

with extracted as (
    select customer_id, order_date, strftime('%Y', order_date) as year,
        case when strftime('%m', order_date) >= '01' and strftime('%m', order_date) <= '03' then 'Q1'
        when strftime('%m', order_date) >= '04' and strftime('%m', order_date) <= '06' then 'Q2'
        when strftime('%m', order_date) >= '07' and strftime('%m', order_date) <= '09' then 'Q3'
        else 'Q4' end as quarter,
        rank() over (partition by customer_id order by order_date) as flag
    from orders
)

select customer_id, concat(year, '-', quarter) as first_quarter
from extracted
where flag = 1
