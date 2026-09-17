-- Xom Data · Delivery performance by size class
-- Problem: https://xomdata.com/practice/medium-case-160
-- Solved: 2026-09-17

with joined as (
    select vehicle_type, capacity_tons, 
        count(shipment_id) as shipment_count,
        case when capacity_tons >= 10 then 'Large Truck'
        when capacity_tons >= 5 then 'Medium Truck'
        else 'Small Truck' end as size_class,
        sum(case when results = 'success' then 1 else 0 end) as delivered,
        round(1.0 * sum(case when results = 'success' then 1 else 0 end) / count(shipment_id) * 100, 2) as delivery_rate,
        rank() over (partition by (case when capacity_tons >= 10 then 'Large Truck' when capacity_tons >= 5 then 'Medium Truck' else 'Small Truck' end) order by round(1.0 * sum(case when results = 'success' then 1 else 0 end) / count(shipment_id) * 100, 2) desc) as rank_in_size
    from trucks
    join shipments on truck_id = trucks.id
    join deliveries on shipment_id = shipments.id
    group by vehicle_type
)

select * from joined
order by size_class, rank_in_size, vehicle_type
