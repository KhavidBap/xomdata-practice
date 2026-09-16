-- Xom Data · Latest readings and over-limit alerts
-- Problem: https://xomdata.com/practice/medium-dedup-003
-- Solved: 2026-09-16

-- Write your SQL here
select sensor_name, max(reading_date) as reading_date, temp_c, max_temp,
    case when temp_c > max_temp then 'Alert' else 'Normal' end as status
from readings
join sensors on sensors.id = readings.sensor_id
group by sensor_name
order by sensor_name
