-- Xom Data · Customer momentum: trending up or down between two seasons
-- Problem: https://xomdata.com/practice/hard-rfm-007
-- Solved: 2026-10-08

with groupped as (
    select customer_id,
        sum(case when order_date >= '2024-01-01' and order_date <= '2024-03-31' then 1 else 0 end) as p1_orders,
        sum(case when order_date >= '2024-04-01' and order_date <= '2024-06-30' then 1 else 0 end) as p2_orders
    from orders
    group by customer_id
)

select *,
    case when p1_orders = 0 and p2_orders > 0 then 'new'
    when p1_orders > 0 and p2_orders = 0 then 'lost'
    when p1_orders > 0 and p2_orders > 0 and p2_orders > p1_orders then 'up'
    when p1_orders > 0 and p2_orders > 0 and p2_orders < p1_orders then 'down'
    when p1_orders > 0 and p2_orders > 0 and p2_orders = p1_orders then 'flat' end as trend
from groupped
where p1_orders > 0 or p2_orders > 0
order by customer_id
