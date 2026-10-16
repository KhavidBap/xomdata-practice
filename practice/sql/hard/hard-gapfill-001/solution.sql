-- Xom Data · Daily revenue including zero-sale days
-- Problem: https://xomdata.com/practice/hard-gapfill-001
-- Solved: 2026-10-16

with daily as (
    select date::date as rev_date, sum(amount) as revenue
    from daily_revenue
    group by date::date
), bounds as (
    select min(rev_date) as min_date, max(rev_date) as max_date
    from daily
), calendar as (
    select generate_series(min_date, max_date, interval '1 day')::date as cal_date
    from bounds
)

select to_char(c.cal_date, 'YYYY-MM-DD') as date,
    coalesce(d.revenue, 0) as revenue
from calendar c
left join daily d on d.rev_date = c.cal_date
order by c.cal_date
