-- Xom Data · Running inventory balance over time
-- Problem: https://xomdata.com/practice/hard-fifo-001
-- Solved: 2026-08-26

with checking as (
    select id, sku, occurred_at, type, quantity, 
        case when type = 'IN' then quantity else -(quantity) end as amount
    from inventory_movements
)

select sku, occurred_at, type, quantity, 
    sum(amount) over (partition by sku order by occurred_at, id) as running_balance
from checking 
order by sku, occurred_at, id
