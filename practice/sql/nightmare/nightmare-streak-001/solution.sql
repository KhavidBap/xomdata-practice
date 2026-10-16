-- Xom Data · Customers active and purchasing 3 weeks in a row
-- Problem: https://xomdata.com/practice/nightmare-streak-001
-- Solved: 2026-10-16

with weeks as (
    select distinct user_id,
        extract(year from event_date::date)::int as yr,
        (extract(doy from event_date::date)::int + 7 - extract(isodow from event_date::date)::int) / 7 as wk
    from events
    where subtype = 'purchase'
), groupped as (
    select user_id, yr, wk,
        wk - row_number() over (partition by user_id, yr order by wk) as grp 
    from weeks
), streaks as (
    select user_id, yr, min(wk) as start_wk, max(wk) as end_wk, count(*) as n_weeks
    from groupped
    group by user_id, yr, grp
    having count(*) >= 3
)

select user_id,
    yr || '-' || lpad(start_wk::text, 2, '0') as streak_start_week,
    yr || '-' || lpad(end_wk::text, 2, '0') as streak_end_week,
    n_weeks
from streaks
order by user_id, streak_start_week
