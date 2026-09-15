-- Xom Data · How far from the server's top
-- Problem: https://xomdata.com/practice/medium-winagg-004
-- Solved: 2026-09-15

-- Write your SQL here
with limited as (
    select server, max(points) as max_points
    from players
    group by server
), joined as (
    select players.server, player_name, points, max_points
    from players
    join limited on players.server = limited.server
)

select server, player_name, points,
    max_points - points as gap_to_top    
from joined
order by server, points desc, player_name
