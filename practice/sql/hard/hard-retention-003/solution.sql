-- Xom Data · Does anyone return the following week
-- Problem: https://xomdata.com/practice/hard-retention-003
-- Solved: 2026-10-30

with weeks as (
    select customer_id,
        ((order_date::date - date '2024-01-01') / 7) + 1 as week_no
    from orders
), cohorts as (
    select customer_id, min(week_no) as cohort_week
    from weeks
    group by customer_id
)

select cohort_week,
    count(*) as cohort_size,
    count(distinct case
        when exists (select 1 from weeks where weeks.customer_id = cohorts.customer_id and week_no = cohort_week + 1) then customer_id end) as retained_next_week
from cohorts
group by cohort_week
order by cohort_week
