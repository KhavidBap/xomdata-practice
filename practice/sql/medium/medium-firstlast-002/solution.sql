-- Xom Data · Each Channel's Most Recent Face
-- Problem: https://xomdata.com/practice/medium-firstlast-002
-- Solved: 2026-08-24

select c.channel, o.customer_id, max(order_date) as last_order_date
from orders o
join customers c on c.customer_id = o.customer_id
group by c.channel
