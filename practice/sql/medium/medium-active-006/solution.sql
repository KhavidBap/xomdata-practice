-- Xom Data · Head-to-head customer count across quarters
-- Problem: https://xomdata.com/practice/medium-active-006
-- Solved: 2026-09-30

with quy as (
    select customer_id,
        concat(
            strftime('%Y', order_date), 
            case when strftime('%m', order_date) in ('01', '02', '03') then '-Q1'
            when strftime('%m', order_date) in ('04', '05', '06') then '-Q2'
            when strftime('%m', order_date) in ('07', '08', '09') then '-Q3'
            else '-Q4' end
        ) as quarter
    from orders
)

select quarter,
    count(distinct customer_id) as active_customers,
    count(distinct customer_id) - lag(count(distinct customer_id)) over (order by quarter) as change_vs_prev
from quy
group by quarter
