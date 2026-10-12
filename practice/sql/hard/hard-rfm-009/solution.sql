-- Xom Data · Each channel's poster child
-- Problem: https://xomdata.com/practice/hard-rfm-009
-- Solved: 2026-10-12

with groupped as (
    select customer_id, max(order_date) as recency, count(order_id) as frequency, sum(amount) as monetary
    from orders group by customer_id
), flagged as (
    select customer_id,
        6 - ntile(5) over (order by recency desc) as r,
        6 - ntile(5) over (order by frequency desc) as f,
        6 - ntile(5) over (order by monetary desc) as m
    from groupped
), ranked as (
    select channel, customer_id, r + f + m as rfm_total,
        row_number() over (partition by channel order by r + f + m desc, customer_id) as rn
    from flagged
    join customers using (customer_id)
)

select channel, customer_id, rfm_total
from ranked
where rn = 1
