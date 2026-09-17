-- Xom Data · The category's flagship next to each item
-- Problem: https://xomdata.com/practice/medium-firstval-001
-- Solved: 2026-09-17

-- Viết SQL của bạn ở đây
with flagged as (
    select category, product_name, 
        row_number() over (partition by category order by price desc, product_name) as flag
    from catalog
), filtered as (
    select category, product_name
    from flagged
    where flag = 1
)

select c.category, c.product_name, c.price, f.product_name as top_product
from catalog c
join filtered f on f.category = c.category
order by c.category, c.price desc, c.product_name
