-- Xom Data · 4-step onboarding conversion rate
-- Problem: https://xomdata.com/practice/hard-funnel-001
-- Solved: 2026-10-19

with steps(step, step_order) as (
    values ('signup', 1), ('verify_email', 2), ('first_login', 3), ('first_purchase', 4)
), step_users as (
    select event_name as step, count(distinct user_id) as n_users
    from events
    group by event_name
), funnel as (
    select steps.step, step_order, coalesce(n_users, 0) as n_users
    from steps
    left join step_users using (step)
)

select step, n_users, round(coalesce(100.0 * n_users / nullif(max(n_users) filter (where step = 'signup') over (), 0), 0), 2) as conversion_pct
from funnel
order by step_order
