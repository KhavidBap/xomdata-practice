-- Xom Data · Ward headcount next to each nurse
-- Problem: https://xomdata.com/practice/medium-winagg-005
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
with w as (
    select ward, count(id) as team_size
    from roster
    group by ward
)

select r.ward, r.nurse_name, w.team_size
from roster r
join w on r.ward = w.ward
order by r.ward, r.nurse_name
