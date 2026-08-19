-- Xom Data · Shift bonus for every top performer
-- Problem: https://xomdata.com/practice/medium-topn-003
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
with ranking as (
    select store, staff_name, orders_served, 
        rank() over (partition by store order by orders_served desc) as r
    from shift_stats
)

select store, staff_name, orders_served
from ranking
where r = 1
order by store, staff_name
