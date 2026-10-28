-- Xom Data · Stadium high-attendance streaks (3+ consecutive days ≥ 100)
-- Problem: https://xomdata.com/practice/nightmare-stadium-001
-- Solved: 2026-10-28

select distinct a.*
from Stadium a, Stadium b, Stadium c
where a.people >= 100 and b.people >= 100 and c.people >= 100
and ((a.id - b.id = 1 and b.id - c.id = 1) or (c.id - b.id = 1 and b.id - a.id = 1) or (b.id - a.id = 1 and a.id - c.id = 1))
order by visit_date
