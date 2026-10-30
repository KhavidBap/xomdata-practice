-- Xom Data · Monthly recurring revenue (MRR) by subscription plan
-- Problem: https://xomdata.com/practice/hard-mrr-001
-- Solved: 2026-10-30

with recursive months as (
    select date_trunc('month', min(started_at::date))::date as month_start from subscriptions
    union all
    select (month_start + interval '1 month')::date from months
    where month_start < (select date_trunc('month', max(started_at::date))::date as month_start from subscriptions)
), month_ends as (
    select to_char(month_start, 'YYYY-MM') as month,
        (month_start + interval '1 month' - interval '1 day')::date as month_end
    from months
)

select month,
    count(user_id) as active_subs,
    coalesce(sum(mrr), 0) as total_mrr
from month_ends 
left join subscriptions on started_at::date <= month_end
    and (ended_at is null or ended_at::date > month_end)
group by month, month_end
order by month
