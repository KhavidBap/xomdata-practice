-- Xom Data · Stock-in history by supplier
-- Problem: https://xomdata.com/practice/medium-join-014
-- Solved: 2026-09-14

select w.warehouse_name,
    coalesce(count(s.id), 0) as import_count,
    coalesce(count(distinct s.product_id), 0) as distinct_product_count,
    coalesce(count(distinct s.suppliers), 0) as distinct_supplier_count,
    max(import_date) as last_import_date,
    rank() over (order by count(s.id) desc) as activity_rank,
    lag(w.warehouse_name, 1) over (order by count(s.id) desc, w.warehouse_name) as prev_warehouse
from warehouses w
inner join stock_imports s on s.warehouse_id = w.id
group by w.warehouse_name
