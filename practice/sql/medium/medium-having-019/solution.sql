-- Xom Data · High-rated sellers with many orders
-- Problem: https://xomdata.com/practice/medium-having-019
-- Solved: 2026-09-16

with joined as (
    select orders.id, store_name, reputation_score
    from orders
    join sellers on orders.seller_id = sellers.id
), filtered as (
    select store_name, reputation_score, count(id) as order_count
    from joined
    where reputation_score >= 4.5
    group by store_name
    having order_count >= 3
)

select *,
    dense_rank() over (order by order_count desc) as rank_by_orders,
    sum(order_count) over (order by order_count desc, store_name) as cumulative_orders
from filtered
