-- Xom Data · Conversion rate through a 4-step purchase funnel
-- Problem: https://xomdata.com/practice/sql-nightmare-009
-- Solved: 2026-10-22

with steps(step, step_order) as (
    values ('visit', 1), ('cart', 2), ('checkout', 3), ('payment', 4)
), step_users as (
    select event as step, count(distinct user_id) as n_users
    from funnel_events
    group by event
), funnel as (
    select steps.step, step_order, coalesce(n_users, 0) as n_users
    from steps
    left join step_users using (step)
)

select step, n_users as users, 
    round(coalesce(100.0 * n_users / nullif(max(n_users) filter (where step = 'visit') over (), 0), 0), 2) as pct_of_total,
    round(100.0 * n_users / nullif(lag(n_users) over (order by step_order), 0), 2) as pct_of_prev
from funnel
order by step_order
