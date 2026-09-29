-- Xom Data · How long before a customer decides to come back a second time
-- Problem: https://xomdata.com/practice/medium-gap-002
-- Solved: 2026-09-29

with flagged as (
    select customer_id, order_date,
        row_number() over (partition by customer_id order by order_date) as flag
    from orders
), filtered as (
    select customer_id, order_date as first_order_date,
        lead(order_date, 1) over (partition by customer_id order by order_date) as second_order_date, flag
    from flagged
)

select customer_id, first_order_date, second_order_date, julianday(second_order_date) - julianday(first_order_date) as days_between
from filtered
where flag = 1 and second_order_date is not null
