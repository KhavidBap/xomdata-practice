-- Xom Data · Product share within its store
-- Problem: https://xomdata.com/practice/medium-winagg-002
-- Solved: 2026-08-26

-- Viết SQL của bạn ở đây
select store, product, amount, round(1.0 * amount / sum(amount) over (partition by store) * 100, 2) as pct_of_store
from store_sales
order by store, product
