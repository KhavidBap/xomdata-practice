-- Xom Data · Purchase rhythm and churn signal
-- Problem: https://xomdata.com/practice/hard-gap-001
-- Solved: 2026-10-28

with gaps as (
    select customer_id, order_date, 
        order_date::date - lag(order_date::date) over (partition by customer_id order by order_date, order_id) as gap_days
    from orders
), stats as (
    select customer_id,
        count(*) as cnt,
        round(avg(gap_days)::numeric, 1) as avg_gap_days
    from gaps
    group by customer_id
)

select customer_id,
    case when cnt = 1 then null else avg_gap_days end as avg_gap_days,
    case when cnt = 1 then 'single'
        when avg_gap_days <= 30 then 'fast'
        else 'slow' end as pace
from stats
