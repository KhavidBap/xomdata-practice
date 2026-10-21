-- Xom Data · Median from a frequency distribution
-- Problem: https://xomdata.com/practice/nightmare-median-freq-001
-- Solved: 2026-10-21

with cumulative as (
    select number, frequency,
        sum(frequency) over (order by number) as cum_now,
        sum(frequency) over (order by number) - frequency as cum_before,
        sum(frequency) over () as total
    from numbers
), positions as (
    select number, cum_before, cum_now, 
        (total + 1) / 2 as p_low,
        total / 2 + 1 as p_high
    from cumulative
)

select avg(number)::float8 as median
from positions
where (cum_before < p_low and p_low <= cum_now) or (cum_before < p_high and p_high <= cum_now)
