-- Xom Data · Balance after each transaction
-- Problem: https://xomdata.com/practice/medium-runtotal-003
-- Solved: 2026-08-21

-- Viết SQL của bạn ở đây
select txn_date, amount,
sum(amount) over (order by txn_date) as balance
from transactions
