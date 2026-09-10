-- Xom Data · Q2 Spending Ledger, Including the Silent Ones
-- Problem: https://xomdata.com/practice/medium-monetary-003
-- Solved: 2026-09-10

select c.customer_id, c.customer_name, case when sum(o.amount) is null then 0 else sum(o.amount) end as q2_spent
from customers c 
left join orders o on o.customer_id = c.customer_id and o.order_date >= '2024-04-01' and o.order_date <= '2024-06-30'
group by c.customer_id
order by q2_spent desc, c.customer_id
