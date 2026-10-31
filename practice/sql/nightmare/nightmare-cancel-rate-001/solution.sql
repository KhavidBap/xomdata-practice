-- Xom Data · Daily trip cancellation rate (unbanned users/drivers only)
-- Problem: https://xomdata.com/practice/nightmare-cancel-rate-001
-- Solved: 2026-10-31

select request_at::date as "Day",
    round(avg(case when status like '%cancelled%' then 1.0 else 0 end), 2) as "Cancellation_Rate"
from trips
join users a on a.users_id = client_id and a.banned = 'No'
join users b on b.users_id = driver_id and b.banned = 'No'
where request_at::date between date '2024-01-01' and date '2024-01-03'
group by request_at::date
order by "Day"
