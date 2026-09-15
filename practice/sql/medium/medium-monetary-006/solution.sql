-- Xom Data · Spend per Active Month
-- Problem: https://xomdata.com/practice/medium-monetary-006
-- Solved: 2026-09-15

with filtered as (
    select order_id, customer_id,
        strftime('%Y-%m', order_date) as month, 
        amount
    from orders
)

select customer_id, 
    sum(amount) as total_spent,
    count(distinct month) as active_months,
    round(1.0 * sum(amount) / count(distinct month), 2) as spend_per_month
from filtered
group by customer_id
order by spend_per_month desc, customer_id
