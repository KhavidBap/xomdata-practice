-- Xom Data · Books about data
-- Problem: https://xomdata.com/practice/easy-like-003
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select title, author
from books
where lower(title) like '%data%'
