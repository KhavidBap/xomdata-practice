-- Xom Data · Minimum coins to make the target amount (unlimited denominations)
-- Problem: https://xomdata.com/practice/nightmare-coinchange-001
-- Solved: 2026-10-29

with recursive dp as (
    select 0 as total, 0 as cnt
    union all
    select total + value, cnt + 1
    from dp
    cross join coins cross join target
    where total + value <= amount
), best as (
    select total, min(cnt) as min_coins
    from dp
    group by total
)

select amount as target, coalesce(min_coins, -1) as min_coins
from target
left join best on total = amount
