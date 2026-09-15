-- Xom Data · Investor trade summary
-- Problem: https://xomdata.com/practice/medium-agg-137
-- Solved: 2026-09-15

with joined as (
  select full_name, segment,
    count(trades.id) as total_trades,
    sum(case when side = 'buy' then amount else 0 end) as total_bought,
    sum(case when side = 'sell' then amount else 0 end) as total_sold
  from investors
  join trades on trades.investor_id = investors.id
  group by full_name
)

select *,
  total_bought - total_sold as net_position,
  case when total_bought > total_sold then 'Bull'
  when total_bought < total_sold then 'Bear'
  else 'Neutral' end as stance,
  dense_rank() over (partition by segment order by (total_bought + total_sold) desc) as rank_in_segment
from joined
order by (total_bought + total_sold) desc, full_name
