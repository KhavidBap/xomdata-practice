-- Xom Data · Customer spending per order
-- Problem: https://xomdata.com/practice/medium-join-001
-- Solved: 2026-09-16

with joined as (
    select full_name, orders.id, total_amount
    from orders
    join customers on customers.id = orders.customer_id
)

select full_name,
    count(id) as order_count,
    sum(total_amount) as total_spending,
    avg(total_amount) as avg_order_value,
    row_number() over (order by sum(total_amount) desc, full_name) as spending_rank
from joined
group by full_name
