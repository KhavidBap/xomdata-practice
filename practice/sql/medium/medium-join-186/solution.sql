-- Xom Data · Goals and cards by team
-- Problem: https://xomdata.com/practice/medium-join-186
-- Solved: 2026-09-17

with detailed as (
    select players.id, team_id,
        count(distinct goals.id) as goal,
        count(distinct penalties.id) as penalty
    from players
    left join goals on goals.player_id = players.id
    left join penalties on penalties.player_id = players.id
    group by players.id
), joined as (
    select team_name, city, detailed.id as player_id, goal, penalty
    from teams
    join detailed on team_id = teams.id
)

select team_name, city,
    count(player_id) as player_count,
    sum(goal) as total_goals_scored,
    sum(penalty) as penalty_count,
    round(1.0 * sum(goal) / count(player_id), 2) as goals_per_player,
    round(1.0 * sum(penalty) / count(player_id), 2) as cards_per_player,
    rank() over (order by sum(goal) desc) as scoring_rank,
    sum(sum(goal)) over (order by sum(goal) desc) as cumulative_goals
from joined
group by team_name
order by scoring_rank, team_name
