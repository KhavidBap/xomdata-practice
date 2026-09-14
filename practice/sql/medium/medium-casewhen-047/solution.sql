-- Xom Data · Portfolio profit/loss
-- Problem: https://xomdata.com/practice/medium-casewhen-047
-- Solved: 2026-09-14

with joined as (
    select stock_code, stock_quantity, avg_cost_price, current_price,
        stock_quantity * (current_price - avg_cost_price) as profit_loss,
        round(1.0 * (current_price - avg_cost_price) / avg_cost_price * 100, 2) as profit_pct
    from stocks
    inner join categories on stocks.id = categories.stock_id
)

select *,
    case when profit_pct > 10 then 'Strong Gain'
    when profit_pct > 0 then 'Mild Gain'
    when profit_pct = 0 then 'Break Even'
    when profit_pct > -10 then 'Mild Loss'
    else 'Strong Loss' end as status,
    rank() over (order by profit_pct desc) as rank_by_pct,
    sum(avg_cost_price * stock_quantity) over (order by profit_pct desc, stock_code) as cumulative_invested
from joined
order by rank_by_pct, stock_code
