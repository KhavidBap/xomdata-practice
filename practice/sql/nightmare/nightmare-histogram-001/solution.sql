-- Xom Data · Largest rectangle in histogram
-- Problem: https://xomdata.com/practice/nightmare-histogram-001
-- Solved: 2026-10-29

with cte as (
    select b1.pos, b1.height,
        (select min(pos) from bars b2 where b2.pos <= b1.pos and not exists
            (select 1 from bars b3 where b3.pos between b2.pos and b1.pos and b3.height < b1.height)) as left_pos,
        (select max(pos) from bars b2 where b2.pos >= b1.pos and not exists
            (select 1 from bars b3 where b3.pos between b1.pos and b2.pos and b3.height < b1.height)) as right_pos
    from bars b1
)

select max(height * (right_pos - left_pos + 1)) as max_area
from cte
