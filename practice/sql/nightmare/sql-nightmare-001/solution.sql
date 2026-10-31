-- Xom Data · Longest consecutive login streak
-- Problem: https://xomdata.com/practice/sql-nightmare-001
-- Solved: 2026-10-31

with days as (
    select distinct user_id, login_date::date as day
    from logins
), groupped as (
    select user_id, day, day - (row_number() over (partition by user_id order by day))::int as flag
    from days
), streaks as (
    select user_id, count(*) as streak
    from groupped
    group by user_id, flag
)

select user_id, max(streak) as max_streak
from streaks
group by user_id
order by user_id
