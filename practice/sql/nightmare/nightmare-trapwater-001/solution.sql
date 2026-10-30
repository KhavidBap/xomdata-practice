-- Xom Data · Rainwater trapped between concrete columns
-- Problem: https://xomdata.com/practice/nightmare-trapwater-001
-- Solved: 2026-10-30

with water as (
    select x, height,
        max(height) over (order by x rows between unbounded preceding and current row) as l,
        max(height) over (order by x rows between current row and unbounded following) as r
    from bars
)
select coalesce(sum(greatest(0, least(l, r) - height)), 0)::bigint as total_water
from water
