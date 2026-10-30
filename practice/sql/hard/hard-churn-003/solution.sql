-- Xom Data · Monthly customer churn rate
-- Problem: https://xomdata.com/practice/hard-churn-003
-- Solved: 2026-10-30

with monthly as (
    select distinct customer_id,
        date_trunc('month', order_date::date)::date as mon
    from orders
), flagged as (
    select a.mon, a.customer_id,
        (b.customer_id is not null) as returned
    from monthly a
    left join monthly b on b.customer_id = a.customer_id
        and b.mon = (a.mon + interval '1 month')::date
    where a.mon < (select max(mon) from monthly)
)

select to_char(mon, 'yyyy-mm') as month,
    count(*) as active_customers,
    count(*) filter (where not returned) as churned_customers,
    round(100.0 * count(*) filter (where not returned) / count(*), 2) as churn_rate_pct
from flagged
group by mon
order by mon
