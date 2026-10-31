-- Xom Data · Merge overlapping bookings into continuous ranges
-- Problem: https://xomdata.com/practice/nightmare-interval-merge-001
-- Solved: 2026-10-31

with book as (
    select id, room_id, start_at::timestamp as start_time, end_at::timestamp as end_time
    from bookings
), flagged as (
    select *, 
        max(end_time) over (partition by room_id order by start_time, id rows between unbounded preceding and 1 preceding) as prev
    from book
), groupped as (
    select *,
        sum(case when prev is null or start_time > prev then 1 else 0 end) over (partition by room_id order by start_time, id) as flag
    from flagged
)

select room_id,
    min(start_time) as merged_start, max(end_time) as merged_end,
    count(*) as n_bookings,
    extract(epoch from (max(end_time) - min(start_time))) / 60 as duration_min
from groupped
group by room_id, flag
order by room_id, merged_start
