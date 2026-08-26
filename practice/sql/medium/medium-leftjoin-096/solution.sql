-- Xom Data · Accounts with no posts
-- Problem: https://xomdata.com/practice/medium-leftjoin-096
-- Solved: 2026-08-26

select full_name, username, account_type,
    dense_rank() over (order by created_at) as signup_order,
    ntile(4) over (order by created_at) as tenure_quartile
from users
where id not in (select distinct user_id from posts)
