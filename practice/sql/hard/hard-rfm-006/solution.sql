-- Xom Data · The eight-segment customer map
-- Problem: https://xomdata.com/practice/hard-rfm-006
-- Solved: 2026-09-29

with filtered as (
    select customer_id, julianday('2024-06-30') - julianday(max(order_date)) as recency, count(order_id) as frequency
    from orders
    group by customer_id
), score as (
    select customer_id,
        case when recency <= 30 then 4 when recency <= 60 then 3 when recency <= 120 then 2 else 1 end as r_score,
        case when frequency >= 10 then 4 when frequency >= 5 then 3 when frequency >= 2 then 2 else 1 end as f_score
    from filtered
)

select *,
    case when r_score >= 3 and f_score >= 3 then 'Champions'
    when r_score >= 3 and f_score = 2 then 'Potential Loyalist'
    when r_score >= 3 and f_score = 1 then 'New Customers'
    when r_score = 2 and f_score >= 3 then 'At Risk'
    when r_score = 2 and f_score <= 2 then 'About To Sleep'
    when r_score = 1 and f_score >= 3 then 'Cannot Lose Them'
    when r_score = 1 and f_score = 2 then 'Hibernating'
    else 'Lost' end as segment
from score
