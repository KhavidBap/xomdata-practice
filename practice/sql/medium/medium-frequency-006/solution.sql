-- Xom Data · Average Orders per Customer by Channel
-- Problem: https://xomdata.com/practice/medium-frequency-006
-- Solved: 2026-09-11

with joined as (
    select o.order_id, o.customer_id, c.channel 
    from orders o 
    inner join customers c on o.customer_id = c.customer_id 
), grouped as (
    select channel, customer_id, count(order_id) as cnt
    from joined
    group by channel, customer_id
), calculated as (
    select channel, count(customer_id) as customers, sum(cnt) as total_orders, 
        round(avg(cnt), 2) as orders_per_customer
    from grouped
    group by channel
    order by orders_per_customer desc, channel
)

select * from calculated
