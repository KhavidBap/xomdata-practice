-- Xom Data · Each branch's two slowest months
-- Problem: https://xomdata.com/practice/medium-topn-004
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
with ranking as (
    select branch, month, revenue,
        row_number() over (partition by branch order by revenue, month) as r
    from branch_monthly
)

select branch, month, revenue
from ranking
where r <= 2
order by branch, revenue, month
