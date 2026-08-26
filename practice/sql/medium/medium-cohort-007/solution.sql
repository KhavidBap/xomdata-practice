-- Xom Data · Who Joined During Promo Season
-- Problem: https://xomdata.com/practice/medium-cohort-007
-- Solved: 2026-08-26

select customer_id, min(order_date) as first_order_date,
    sum(case when order_date >= '2024-03-01' and order_date <= '2024-03-31' then 1 else 0 end) as campaign_orders
from orders
group by customer_id
having min(order_date) >= '2024-03-01' and min(order_date) <= '2024-03-31';
