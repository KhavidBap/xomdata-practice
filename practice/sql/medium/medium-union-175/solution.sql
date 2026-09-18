-- Xom Data · Summary of issues to handle
-- Problem: https://xomdata.com/practice/medium-union-175
-- Solved: 2026-09-18

with unioned as (
    select 'Complaint' as type,
        count(id) as quantity
    from complaints
    where status = 'Pending'

    union all

    select 'Cancelled Order' as type,
        count(id) as quantity
    from orders
    where status = 'Cancelled'

    union all

    select 'Out of Stock Product' as type,
        count(id) as quantity
    from products
    where status = 'Out of Stock'
), filtered as (
    select type, quantity,
        round(1.0 * quantity / (select sum(quantity) from unioned) * 100, 2) as pct_of_total,
        rank() over (order by quantity desc) as rank_pos
    from unioned
)

select *,
    round(sum(quantity) over (order by rank_pos, type) * 100.0 / (select sum(quantity) from unioned), 2) as cumulative_pct
from filtered
