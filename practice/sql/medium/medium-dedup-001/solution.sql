-- Xom Data · Each customer's latest contact number
-- Problem: https://xomdata.com/practice/medium-dedup-001
-- Solved: 2026-09-10

-- Write your SQL here
with grouped as (
    select customer_name, phone, updated_date,
        row_number() over (partition by customer_name order by updated_date desc) as flag
    from contact_updates
)

select customer_name, phone, updated_date 
from grouped
where flag = 1
order by customer_name
