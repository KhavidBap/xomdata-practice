-- Xom Data · Diligent customers across all four quarters
-- Problem: https://xomdata.com/practice/medium-repeat-006
-- Solved: 2026-09-11

with q as (
    select customer_id, 
        case when order_date >= '2024-01-01' and order_date < '2024-04-01' then 1 else 0 end as q1, 
        case when order_date >= '2024-04-01' and order_date < '2024-07-01' then 1 else 0 end as q2, 
        case when order_date >= '2024-07-01' and order_date < '2024-10-01' then 1 else 0 end as q3, 
        case when order_date >= '2024-10-01' and order_date < '2025-01-01' then 1 else 0 end as q4
    from orders 
), qrt as (
    select customer_id, sum(q1) as q1, sum(q2) as q2, sum(q3) as q3, sum(q4) as q4, sum(q1) + sum(q2) + sum(q3) + sum(q4) as orders_2024
    from q
    group by customer_id
)

select customer_id, orders_2024
from qrt
where q1 >= 1 and q2 >= 1 and q3 >= 1 and q4 >= 1
