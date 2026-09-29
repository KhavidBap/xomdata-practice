-- Xom Data · Players with 3 or more goals
-- Problem: https://xomdata.com/practice/medium-having-187
-- Solved: 2026-09-29

with goals_group as (
    select player_id, count(id) as goal_count,
        count(distinct match_id) as scoring_matches,
        round(1.0 * count(id) / count(distinct match_id), 2) as goals_per_match
    from goals
    group by player_id
), penalties_group as (
    select player_id, count(id) as cards_received
    from penalties
    group by player_id
), groupped as (
    select full_name, positions, team_name, goal_count, scoring_matches, coalesce(cards_received, 0) as cards_received, goals_per_match,
        dense_rank() over (order by goals_per_match desc) as efficiency_rank,
        rank() over (order by goal_count desc) as volume_rank
    from players
    join teams on teams.id = team_id
    join goals_group on players.id = goals_group.player_id
    left join penalties_group on players.id = penalties_group.player_id
    where goal_count >= 3 and coalesce(cards_received, 0) < 5
)

select * from groupped
order by efficiency_rank, full_name
