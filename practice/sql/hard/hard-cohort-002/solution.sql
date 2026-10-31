-- Xom Data · Repeat-customer tracking table by cohort
-- Problem: https://xomdata.com/practice/hard-cohort-002
-- Solved: 2026-10-31

with months as (
    select distinct customer_id, date_trunc('month', order_date::date)::date as mon
    from orders
), cohort as (
    select customer_id, min(mon) as first_mon
    from months
    group by customer_id
), groupped as (
    select first_mon, customer_id,
        (extract(year from age(mon, first_mon)) * 12 + extract(month from age(mon, first_mon)))::int as mon_age
    from months
    join cohort using (customer_id)
)

select to_char(first_mon, 'YYYY-MM') as cohort_month,
    count(*) filter (where mon_age = 0) as m0,
    count(*) filter (where mon_age = 1) as m1,
    count(*) filter (where mon_age = 2) as m2,
    count(*) filter (where mon_age = 3) as m3
from groupped 
group by first_mon
order by first_mon
