-- Xom Data · Splitting deliveries into three shifts by order time
-- Problem: https://xomdata.com/practice/medium-ntile-002
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
with marking as (
    select order_code, order_time,
        row_number() over (order by order_time, order_code) as flag
    from morning_orders
)

select order_code, order_time,
    case when flag <= ceil((select count(*) from morning_orders) / 3.0) then 1
    when flag <= ceil((select count(*) from morning_orders) / 3.0 * 2.0) then 2
    else 3 end as delivery_shift
from marking
