-- Xom Data · The month that exploded with new customers
-- Problem: https://xomdata.com/practice/medium-active-003
-- Solved: 2026-08-24

with thang as (
    select customer_id, strftime('%Y-%m', order_date) as month, 
        row_number() over (partition by customer_id order by order_date) as flag
    from orders
), grouped as (
    select month, count(customer_id) as new_customers
    from thang
    where flag = 1
    group by month
)

select * from grouped
order by new_customers desc, month
limit 1
