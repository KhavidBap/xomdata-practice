-- Xom Data · A single composite number per customer
-- Problem: https://xomdata.com/practice/hard-rfm-008
-- Solved: 2026-09-29

with groupped as (
    select customer_id, max(order_date) as recency, count(order_id) as frequency, sum(amount) as monetary
    from orders group by customer_id
), flagged as (
    select customer_id,
        6 - ntile(5) over (order by recency desc) as r_score,
        6 - ntile(5) over (order by frequency desc) as f_score,
        6 - ntile(5) over (order by monetary desc) as m_score
    from groupped
)

select *, concat(r_score, f_score, m_score) as weighted_score
from flagged
