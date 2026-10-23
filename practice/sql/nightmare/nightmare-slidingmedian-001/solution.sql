-- Xom Data · Centered 5-session rolling median price per session
-- Problem: https://xomdata.com/practice/nightmare-slidingmedian-001
-- Solved: 2026-10-23

select p1.day,
    round((percentile_cont(0.5) within group (order by p2.price))::numeric, 2) as median_price
from prices p1
join prices p2 on p2.day between p1.day - 2 and p1.day + 2
group by p1.day
order by p1.day
