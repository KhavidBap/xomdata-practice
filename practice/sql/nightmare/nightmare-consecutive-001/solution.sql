-- Xom Data · Numbers appearing 3 times in a row in the log
-- Problem: https://xomdata.com/practice/nightmare-consecutive-001
-- Solved: 2026-09-25

with lag_lead as (
    select lag(num) over (order by id) as prev,
        num as curr, 
        lead(num) over (order by id) as next
    from Logs
)

select distinct curr as consecutive_num from lag_lead
where prev = curr and curr = next
order by consecutive_num
