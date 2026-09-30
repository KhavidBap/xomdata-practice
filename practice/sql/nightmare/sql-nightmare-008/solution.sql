-- Xom Data · Score customers by RFM
-- Problem: https://xomdata.com/practice/sql-nightmare-008
-- Solved: 2026-09-30

with groupped as (
    select customer_id, 
        julianday((select max(txn_date) from transactions)) - julianday(max(txn_date)) + 1 as recency,
        count(customer_id) as frequency,
        round(sum(amount), 2) as monetary
    from transactions
    group by customer_id
), flagged as (
    select *,
        ntile(5) over (order by recency desc) as r_score,
        ntile(5) over (order by frequency) as f_score,
        ntile(5) over (order by monetary) as m_score
    from groupped
)

select *,
    round((r_score * 0.4) + (f_score * 0.3) + (m_score * 0.3), 2) as rfm_score
from flagged
order by rfm_score desc, customer_id
