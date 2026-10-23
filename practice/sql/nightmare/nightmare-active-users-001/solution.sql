-- Xom Data · Users active 5+ consecutive days
-- Problem: https://xomdata.com/practice/nightmare-active-users-001
-- Solved: 2026-10-23

with daily as (
    select distinct id, login_date::date as login_date
    from logins
), ahead as (
    select id, login_date,
        lead(login_date, 4) over (partition by id order by login_date) as date_plus_4
    from daily
)

select distinct id
from ahead
where date_plus_4 - login_date = 4
order by id;
