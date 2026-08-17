-- Xom Data · Categories full enough for the homepage
-- Problem: https://xomdata.com/practice/easy-having-001
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select category, count(id) as num_products
from products
group by category
having count(id) >= 3
