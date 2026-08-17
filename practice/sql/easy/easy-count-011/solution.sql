-- Xom Data · Accounts still missing a tax code
-- Problem: https://xomdata.com/practice/easy-count-011
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select count(id) as missing_tax_code
from accounts
where tax_code is null
