-- Xom Data · The current price of each product
-- Problem: https://xomdata.com/practice/medium-dedup-002
-- Solved: 2026-08-21

-- Viết SQL của bạn ở đây
select product_name, price, max(effective_date) as effective_date
from price_history
group by product_name
