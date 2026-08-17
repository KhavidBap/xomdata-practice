-- Xom Data · Users who never took a ride
-- Problem: https://xomdata.com/practice/easy-leftjoin-001
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select user_name, joined_date
from users
where id not in (select user_id from rides)
