-- Xom Data · Detect anomalous days vs the average
-- Problem: https://xomdata.com/practice/hard-anomaly-001
-- Solved: 2026-09-23

with calculated as (
    select date, value,
        (select round(avg(value), 2) from daily_metrics) as mean,
        (select round(sqrt((sum(value * value) - 2 * sum(value) * avg(value) + avg(value) * avg(value) * count(*)) / count(*)), 2) from daily_metrics) as stddev
    from daily_metrics
)

select *,
    case when stddev = 0 then 0 else round((value - mean) / stddev, 2) end as z_score,
    case when (value - mean) / stddev > 2 then 'high'
    when (value - mean) / stddev < -2 then 'low'
    else 'normal' end as flag
from calculated
