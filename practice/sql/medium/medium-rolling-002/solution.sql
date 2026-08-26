-- Xom Data · Three-day rolling total per store
-- Problem: https://xomdata.com/practice/medium-rolling-002
-- Solved: 2026-08-26

-- Viết SQL của bạn ở đây
select store, sale_date, units_sold, 
    case when lag(units_sold, 1) over (partition by store order by sale_date) is null then units_sold
    when lag(units_sold, 2) over (partition by store order by sale_date) is null then units_sold + lag(units_sold, 1) over (partition by store order by sale_date)
    else units_sold + lag(units_sold, 1) over (partition by store order by sale_date) + lag(units_sold, 2) over (partition by store order by sale_date) end as sum_3d
from daily_sales
