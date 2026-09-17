-- Xom Data · Candidates not yet interviewed
-- Problem: https://xomdata.com/practice/medium-leftjoin-031
-- Solved: 2026-09-17

select full_name, email, application_date,
    row_number() over (order by application_date, full_name) as queue_position,
    round(percent_rank() over (order by application_date, full_name) * 100, 2) as older_than_pct
from candidates
where candidates.id not in (select distinct candidate_id from interviews)
