-- Xom Data · Each device's next service date
-- Problem: https://xomdata.com/practice/medium-lead-001
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
select device_code, service_date, 
    lead(service_date, 1) over (partition by device_code order by service_date) as next_service
from service_log
order by device_code, service_date
