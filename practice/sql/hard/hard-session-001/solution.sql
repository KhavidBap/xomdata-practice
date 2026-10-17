-- Xom Data · Sessionize logins with a 30-minute gap
-- Problem: https://xomdata.com/practice/hard-session-001
-- Solved: 2026-10-17

with ordered as (
    select user_id,
        event_at::timestamp as event_ts,
        lag(event_at::timestamp) over (partition by user_id order by event_at::timestamp, id) as prev_ts
    from events
), flagged as (
    select user_id, event_ts,
        case when prev_ts is null or event_ts - prev_ts > interval '30 minutes' then 1
        else 0 end as is_new_session
    from ordered
), numbered as (
    select user_id, event_ts,
        sum(is_new_session) over (partition by user_id order by event_ts rows between unbounded preceding and current row) as session_seq
    from flagged
)

select user_id, session_seq,
    count(*) as n_events,
    to_char(min(event_ts), 'YYYY-MM-DD HH24:MI:SS') as session_start,
    to_char(max(event_ts), 'YYYY-MM-DD HH24:MI:SS') as session_end,
    round(extract(epoch from (max(event_ts) - min(event_ts)))::numeric / 60, 1) as duration_min
from numbered
group by user_id, session_seq
order by user_id, session_seq
