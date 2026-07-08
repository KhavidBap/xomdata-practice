-- Xom Data · Top-scoring players
-- Problem: https://xomdata.com/practice/easy-where-027
-- Solved: 2026-07-08

-- Viết SQL của bạn ở đây
SELECT full_name, goals_scored
FROM players
WHERE goals_scored > 10
ORDER BY goals_scored DESC
