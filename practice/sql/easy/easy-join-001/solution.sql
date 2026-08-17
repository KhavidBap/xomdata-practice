-- Xom Data · Orders with customer names
-- Problem: https://xomdata.com/practice/easy-join-001
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select o.order_code, c.customer_name, o.amount
from orders o
join customers c on c.id = o.customer_id
