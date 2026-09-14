-- Xom Data · Top 10 most-engaged posts
-- Problem: https://xomdata.com/practice/medium-groupby-097
-- Solved: 2026-09-14

with joined as (
    select u.full_name, p.post_type, p.post_date, p.like_count + p.comment_count + p.share_count as total_interactions
    from posts p
    inner join users u on u.id = p.user_id
)

select *,
    rank() over (order by total_interactions desc) as overall_rank,
    row_number() over (partition by full_name order by total_interactions desc, post_date) as rank_in_author,
    round(1.0 * total_interactions / (select max(total_interactions) from joined) * 100, 2) as pct_of_top
from joined
order by total_interactions desc
limit 10
