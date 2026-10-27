-- Xom Data · Most common 3-step user path
-- Problem: https://xomdata.com/practice/hard-pathanalysis-001
-- Solved: 2026-10-27

with paths as (
    select user_id,
        page || ' > ' ||
            lead(page, 1) over (partition by user_id order by viewed_at) || ' > ' ||
            lead(page, 2) over (partition by user_id order by viewed_at) as path
    from page_views
), distinct_paths as (
    select user_id, path
    from paths
    where path is not null
)

select path, count(user_id) as n_users
from distinct_paths
group by path
order by n_users desc, path
limit 10
