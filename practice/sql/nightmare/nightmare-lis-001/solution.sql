-- Xom Data · Longest rising price run over N trading sessions
-- Problem: https://xomdata.com/practice/nightmare-lis-001
-- Solved: 2026-10-25

with recursive chains as (
    select day, price, 1 as len, price::text as seq
    from prices
    union all
    select p.day, p.price, c.len + 1, c.seq || ',' || p.price::text
    from chains c
    join prices p on p.day > c.day and p.price > c.price
)

select len as lis_length, seq as lis_sequence
from chains
order by len desc, seq collate "C"
limit 1
