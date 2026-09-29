-- Xom Data · Each cohort's size and first-month cash
-- Problem: https://xomdata.com/practice/medium-cohort-008
-- Solved: 2026-09-29

with filtered as (
    select customer_id, strftime('%Y-%m', order_date) as month,
        case when row_number() over (partition by customer_id order by order_date, order_id) = 1 then 1 else 0 end as num, amount
    from orders
), groupped as (
    select customer_id, month, sum(num) as flag, sum(amount) as first_month_revenue
    from filtered
    group by customer_id, month
    having sum(num) = 1
)

select month as cohort_month, count(customer_id) as cohort_size,
    sum(first_month_revenue) as first_month_revenue
from groupped
group by month
order by month
