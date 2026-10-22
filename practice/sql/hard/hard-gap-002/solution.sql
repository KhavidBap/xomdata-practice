-- Xom Data · The longest silence period for each customer
-- Problem: https://xomdata.com/practice/hard-gap-002
-- Solved: 2026-10-22

with gaps as (
    select customer_id,
        lag(order_date) over (partition by customer_id order by order_date, order_id) as gap_start,
        order_date as gap_end,
        order_date::date - lag(order_date::date) over (partition by customer_id order by order_date, order_id) as gap_days
    from orders
), filtered as (
    select *,
        row_number() over (partition by customer_id order by gap_days desc, gap_start) as rn
    from gaps
    where gap_start is not null
)

select customer_id, gap_start, gap_end, gap_days
from filtered
where rn = 1
order by gap_days desc, customer_id
