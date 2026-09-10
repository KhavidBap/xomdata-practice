-- Xom Data · Who showed up in two consecutive months
-- Problem: https://xomdata.com/practice/medium-active-002
-- Solved: 2026-09-10

with grouped as (
    select customer_id,
        sum(case when order_date >= '2024-03-01' and order_date < '2024-04-01' then 1 else 0 end) as mar,
        sum(case when order_date >= '2024-04-01' and order_date < '2024-05-01' then 1 else 0 end) as apr
    from orders 
    group by customer_id        
)

select customer_id from grouped
where mar >= 1 and apr >= 1
