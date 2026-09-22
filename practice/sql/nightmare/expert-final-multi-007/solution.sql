-- Xom Data · Top 2 salespeople by sales each month
-- Problem: https://xomdata.com/practice/expert-final-multi-007
-- Solved: 2026-09-22

with groupped as (
    select employee_id, month, sum(revenue) as total_sales
    from sales
    group by employee_id, month
), flagged as (
    select month,
        dense_rank() over (partition by month order by total_sales desc) as sales_rank,
        employee_id, full_name, total_sales
    from groupped
    join employees on employees.id = employee_id
)

select * from flagged
where sales_rank <= 2
