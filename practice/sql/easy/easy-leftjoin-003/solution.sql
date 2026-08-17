-- Xom Data · Booking count per branch
-- Problem: https://xomdata.com/practice/easy-leftjoin-003
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select br.branch_name, 
    case when count(bo.id) is null then 0 else count(bo.id) end as num_bookings
from branches br
left join bookings bo on br.id = bo.branch_id
group by br.branch_name
