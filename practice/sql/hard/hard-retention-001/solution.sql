-- Xom Data · D7 and D30 retention rate
-- Problem: https://xomdata.com/practice/hard-retention-001
-- Solved: 2026-10-15

with flag as (
    select s.user_id, exists (
        select 1 from activity a
        where a.user_id = s.user_id and a.active_date::date between s.signup_date::date + 1 and s.signup_date::date + 7
    ) as is_d7, exists (
        select 1 from activity a
        where a.user_id = s.user_id and a.active_date::date between s.signup_date::date + 1 and s.signup_date::date + 30
    ) as is_d30
    from signups s
)

select count(*) as total_users,
    count(*) filter (where is_d7) as d7_retained,
    round(coalesce(100.0 * count(*) filter (where is_d7)  / nullif(count(*), 0), 0), 2) as d7_rate,
    count(*) filter (where is_d30) as d30_retained,
    round(coalesce(100.0 * count(*) filter (where is_d30)  / nullif(count(*), 0), 0), 2) as d30_rate
from flag
