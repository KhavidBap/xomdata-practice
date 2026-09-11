-- Xom Data · Check a 3×3 magic square
-- Problem: https://xomdata.com/practice/nightmare-magicsquare-001
-- Solved: 2026-09-11

with hang as (
    select row as id, sum(val) as total
    from cells
    group by row
), cot as (
    select col as id, sum(val) as total
    from cells
    group by col
), cheo1 as (
    select 1 as id, val 
    from cells
    where (row = 1 and col = 1) or (row = 2 and col = 2) or (row = 3 and col = 3)
), cheo2 as (
    select 2 as id, val 
    from cells
    where (row = 1 and col = 3) or (row = 2 and col = 2) or (row = 3 and col = 1)
), cheos as (
    select * from cheo1
    union all
    select * from cheo2
), cheo as (
    select id, sum(val) as total
    from cheos
    group by id
), tong as (
    select * from cot
    union all
    select * from hang
    union all 
    select * from cheo
)

select 
    case when count(distinct total) = 1 then 1 else 0 end as is_magic
from tong
