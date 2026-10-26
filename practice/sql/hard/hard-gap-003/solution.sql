-- Xom Data · Predicting the customer's next visit date
-- Problem: https://xomdata.com/practice/hard-gap-003
-- Solved: 2026-10-26

with gaps as (
    select customer_id,
        order_date::date as order_date,
        order_date::date - lag(order_date::date) over (partition by customer_id order by order_date::date, order_id) as gap
    from orders
), agg as (
    select customer_id,
        max(order_date) as last_order_date,
        floor(avg(gap))::int as avg_gap_days
    from gaps
    group by customer_id
    having count(*) >= 2
)

select customer_id, last_order_date, avg_gap_days,
    to_char(last_order_date + avg_gap_days, 'yyyy-mm-dd') as predicted_next_date
from agg
order by last_order_date + avg_gap_days, customer_id;
