-- Xom Data · Basic-plan subscribers
-- Problem: https://xomdata.com/practice/easy-like-001
-- Solved: 2026-07-08

-- Viết SQL của bạn ở đây
SELECT phone_number, full_name, plans
FROM subscribers
WHERE UPPER(SUBSTRING(plans, 1, 5)) = 'BASIC'
ORDER BY full_name
