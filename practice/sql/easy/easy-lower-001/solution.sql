-- Xom Data · Normalizing emails before matching
-- Problem: https://xomdata.com/practice/easy-lower-001
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select email, lower(email) as normalized_email
from subscribers
