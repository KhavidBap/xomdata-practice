-- Xom Data · Top 10 highest-profit dishes
-- Problem: https://xomdata.com/practice/medium-agg-147
-- Solved: 2026-09-16

with joined as (
    select category_name, dish_name, cost_price, status, quantity, unit_price
    from categories 
    join dishes on category_id = categories.id
    join order_items on dish_id = dishes.id
    join orders on order_id = orders.id
)

select dish_name, category_name,
    sum(quantity) as total_sold,
    sum(quantity) * unit_price as revenue,
    sum(quantity) * (unit_price - cost_price) as profit,
    round(1.0 * (unit_price - cost_price) / unit_price * 100, 2) as margin_pct,
    rank() over (order by sum(quantity) * (unit_price - cost_price) desc) as rank_by_profit,
    rank() over (order by 1.0 * (unit_price - cost_price) / unit_price * 100 desc) as rank_by_margin
from joined
group by dish_name
order by profit desc, dish_name
limit 10
