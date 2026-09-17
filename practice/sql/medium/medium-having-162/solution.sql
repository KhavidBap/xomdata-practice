-- Xom Data · Suppliers that deliver late frequently
-- Problem: https://xomdata.com/practice/medium-having-162
-- Solved: 2026-09-17

select supplier_name, material_type,
    count(purchase_orders.id) as purchase_count,
    sum(total_value) as total_purchase_value,
    round(avg(julianday(actual_receipt) - julianday(expected_receipt)), 2) as avg_late_days,
    round(1.0 * sum(case when julianday(actual_receipt) - julianday(expected_receipt) <= 0 then 1 else 0 end) / count(purchase_orders.id) * 100, 2) as on_time_rate, 
    rank() over (order by avg(julianday(actual_receipt) - julianday(expected_receipt)) desc) as late_rank,
    ntile(4) over (order by avg(julianday(actual_receipt) - julianday(expected_receipt)) desc, supplier_name) as risk_tier
from suppliers
join purchase_orders on supplier_id = suppliers.id
group by supplier_name
having purchase_count >= 3 and avg_late_days > 0
