-- Xom Data · Frequently co-purchased product pairs
-- Problem: https://xomdata.com/practice/sql-nightmare-004
-- Solved: 2026-10-29

select o1.product_id as product_a, o2.product_id as product_b,
    count(distinct o1.user_id) as co_buyers
from orders o1
join orders o2 on o1.user_id = o2.user_id and o1.product_id < o2.product_id
group by o1.product_id, o2.product_id
order by co_buyers desc, product_a, product_b
