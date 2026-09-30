-- Xom Data · Maximum subarray (Kadane)
-- Problem: https://xomdata.com/practice/nightmare-kadane-001
-- Solved: 2026-09-30

with prefix as (
    select idx, val,
        sum(val) over (order by idx) as pre
    from arr
), run as (
    select idx, val, pre, 
        min(pre) over (order by idx rows between unbounded preceding and 1 preceding) as r_min
    from prefix
)

select max(pre - least(coalesce(r_min, 0), 0)) as max_subarray_sum
from run
