-- Xom Data · Longest run of consecutive active months
-- Problem: https://xomdata.com/practice/hard-streak-001
-- Solved: 2026-10-23

with months as (
    select distinct customer_id,
        (extract(year from order_date::date) * 12 + extract(month from order_date::date))::int as m
    from orders
), grp as (
    select customer_id, m,
        m - (row_number() over (partition by customer_id order by m))::int as g
    from months
), streaks as (
    select customer_id, count(*) as len
    from grp
    group by customer_id, g
)

select customer_id, max(len) as longest_streak
from streaks
group by customer_id
order by longest_streak desc, customer_id
