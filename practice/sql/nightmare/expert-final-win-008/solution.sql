-- Xom Data · Cumulative revenue and cumulative % of the period total
-- Problem: https://xomdata.com/practice/expert-final-win-008
-- Solved: 2026-09-21

with groupped as (
    select period, sum(revenue) as period_revenue
    from sales
    group by period
)

select *,
    sum(period_revenue) over (order by period) as running_total,
    (select sum(period_revenue) from groupped) as grand_total,
    round(1.0 * sum(period_revenue) over (order by period) / (select sum(period_revenue) from groupped) * 100, 1) as cumulative_pct
from groupped
order by period
