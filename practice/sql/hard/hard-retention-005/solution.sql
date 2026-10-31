-- Xom Data · Surviving from the second month onward
-- Problem: https://xomdata.com/practice/hard-retention-005
-- Solved: 2026-10-31

with months as (
    select distinct customer_id, date_trunc('month', order_date::date)::date as month
    from orders
), cohort as (
    select customer_id, min(month) as first_month
    from months
    group by customer_id
), flagged as (
    select customer_id, first_month,
        bool_or(month >= (first_month + interval '2 months')::date) as survived
    from cohort
    join months using (customer_id)
    group by customer_id, first_month
)

select to_char(first_month, 'YYYY-MM') as cohort_month,
    count(*) as cohort_size,
    count(*) filter (where survived) as survivors,
    round(100.0 * count(*) filter (where survived) / count(*), 2) as survival_pct
from flagged
group by first_month
order by first_month
