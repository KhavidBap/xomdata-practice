-- Xom Data · Retention rate by signup-month cohort
-- Problem: https://xomdata.com/practice/hard-cohort-001
-- Solved: 2026-09-15

with filtered as (
    select strftime('%Y-%m', active_date) as active_month, strftime('%Y-%m', signup_date) as signup_month, activity.user_id
    from activity
    left join signups on signups.user_id = activity.user_id
)

select signup_month, active_month, count(distinct user_id) as n_active
from filtered
where active_month >= signup_month
group by signup_month, active_month
