-- Xom Data · Each aisle's best seller
-- Problem: https://xomdata.com/practice/medium-winjoin-003
-- Solved: 2026-08-26

-- Viết SQL của bạn ở đây
with grouped as (
    select c.category_name, p.product_name, p.units_sold
    from categories c 
    join products p on c.id = p.category_id
)

select category_name, product_name, max(units_sold) as units_sold
from grouped
group by category_name
