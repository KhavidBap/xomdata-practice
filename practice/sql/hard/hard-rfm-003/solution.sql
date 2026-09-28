-- Xom Data · Freshness score plus diligence points
-- Problem: https://xomdata.com/practice/hard-rfm-003
-- Solved: 2026-09-28

with groupped as (
    select customer_id, max(order_date) as newest_date, count(order_id) as num_orders
    from orders
    group by customer_id
), filtered as (
    select customer_id, (6 - ntile(5) over (order by newest_date desc)) as r_score,
        case when num_orders >= 8 then 3 when num_orders >= 4 then 2 else 1 end as f_score
    from groupped
)

select *, r_score + f_score as total_score,
    case when r_score + f_score >= 7 then 'Gold'
    when r_score + f_score >= 5 then 'Silver'
    else 'Bronze' end as label
from filtered
