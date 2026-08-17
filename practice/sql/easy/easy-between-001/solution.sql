-- Xom Data · Products in a price range
-- Problem: https://xomdata.com/practice/easy-between-001
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select distinct product_name, price
from products
where price >= 200 and price <= 500
