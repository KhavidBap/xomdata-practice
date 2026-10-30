-- Xom Data · Who is still on an active streak today
-- Problem: https://xomdata.com/practice/hard-streak-002
-- Solved: 2026-10-30

with months as (
    select distinct customer_id,
        extract(year from order_date::date) * 12 + extract(month from order_date::date) as month_num
    from orders
), active as (
    select distinct customer_id from orders
    where date_trunc('month', order_date::date) = date '2024-06-01'
), ranked as (
    select months.customer_id, month_num,
        row_number() over (partition by customer_id order by month_num desc) as flag
    from months
    join active using (customer_id)
), groups as (
    select *, month_num + flag as grp
    from ranked
), streaks as (
    select customer_id, count(*) as current_streak
    from groups
    where grp = (select month_num + 1 from months where months.customer_id = groups.customer_id and months.month_num = 2024 * 12 + 6)
    group by customer_id
)

select * from streaks
order by current_streak desc, customer_id
