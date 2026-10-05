-- Xom Data · Next session with a higher price
-- Problem: https://xomdata.com/practice/nightmare-nextgreater-001
-- Solved: 2026-10-05

select p.day, p.price,
    n.day as next_higher_day,
    n.day - p.day as days_until
from prices p
left join lateral (
    select p2.day
    from prices p2
    where p2.day > p.day and p2.price > p.price
    order by p2.day
    limit 1
) n on true
order by p.day
