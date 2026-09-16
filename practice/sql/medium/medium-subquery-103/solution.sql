-- Xom Data · Products more expensive than the category average
-- Problem: https://xomdata.com/practice/medium-subquery-103
-- Solved: 2026-09-16

with average as (
    select category, avg(price) as avg_price
    from products
    group by category
)

select product_name, products.category, price,
    price - avg_price as diff_from_avg,
    round(1.0 * (price - avg_price) / avg_price * 100, 2) as pct_above
from products
join average on products.category = average.category
where price > avg_price
order by pct_above desc, product_name
