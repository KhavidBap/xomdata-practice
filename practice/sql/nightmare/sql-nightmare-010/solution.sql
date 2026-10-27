-- Xom Data · TWAP per stock symbol
-- Problem: https://xomdata.com/practice/sql-nightmare-010
-- Solved: 2026-10-27

with ticket as (
    select symbol, price,
        extract(epoch from lead(tick_time::timestamp) over (partition by symbol order by tick_time::timestamp) - tick_time::timestamp) as dur
    from price_ticks
)

select symbol, round((sum(price * dur) / sum(dur))::numeric, 4) as twap
from ticket
where dur is not null
group by symbol
order by symbol
