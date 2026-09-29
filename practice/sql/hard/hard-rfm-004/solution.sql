-- Xom Data · A three-digit code says it all
-- Problem: https://xomdata.com/practice/hard-rfm-004
-- Solved: 2026-09-29

with groupped as (
    select customer_id, max(order_date) as recency, count(order_id) as frequency, sum(amount) as monetary
    from orders group by customer_id
), flagged as (
    select customer_id,
        6 - ntile(5) over (order by recency desc) as r,
        6 - ntile(5) over (order by frequency desc) as f,
        6 - ntile(5) over (order by monetary desc) as m
    from groupped
)

select customer_id, concat(r, f, m) as rfm_code
from flagged
