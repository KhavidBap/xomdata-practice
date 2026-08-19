-- Xom Data · Top two films per genre, rank included
-- Problem: https://xomdata.com/practice/medium-topn-005
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
with ranked as (
    select genre,
        row_number() over (partition by genre order by revenue desc, title) as rank_in_genre,
        title, revenue
    from box_office
)

select * from ranked
where rank_in_genre <= 2
