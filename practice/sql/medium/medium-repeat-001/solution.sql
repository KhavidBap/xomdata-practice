-- Xom Data · One-time buyers vs. repeat customers
-- Problem: https://xomdata.com/practice/medium-repeat-001
-- Solved: 2026-08-20

with cnt as (
    select customer_id, count(order_id) as cnt_id
    from orders
    group by customer_id
), customer as (
    select 'one-time' as customer_type, count(customer_id) as customer_count
    from cnt
    where cnt_id = 1
    union all
    select 'repeat' as customer_type, count(customer_id) as customer_count
    from cnt
    where cnt_id > 1
)

select * from customer
where customer_count > 0
