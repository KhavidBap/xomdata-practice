-- Xom Data · Ticket statuses guests can read
-- Problem: https://xomdata.com/practice/easy-join-005
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select t.ticket_code, s.status_name
from tickets t
join statuses s on s.code = t.status_code
