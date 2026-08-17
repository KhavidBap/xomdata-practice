-- Xom Data · Total spend per member
-- Problem: https://xomdata.com/practice/easy-leftjoin-002
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select m.member_name, 
    case when sum(b.amount) is null then 0 else sum(b.amount) end as total_spent
from members m
left join bills b on m.id = b.member_id
group by m.member_name
