-- Xom Data · Transaction count and amount by month
-- Problem: https://xomdata.com/practice/medium-datefunction-045
-- Solved: 2026-08-26

with filtered as (
    select id, strftime('%Y-%m', transaction_date) as month, amount
    from transactions
), grouped as (
    select month, count(id) as transaction_count, sum(amount) as total_amount
    from filtered
    group by month
)

select month, transaction_count, total_amount,
    total_amount - lag(total_amount, 1) over (order by month) as mom_delta
from grouped
