-- Xom Data · The same customer's previous order
-- Problem: https://xomdata.com/practice/medium-winjoin-004
-- Solved: 2026-08-19

-- Viết SQL của bạn ở đây
select m.member_name, p.purchase_date, p.amount,
    lag(p.amount, 1) over (partition by p.member_id order by p.purchase_date) as prev_amount
from purchases p
join members m on m.id = p.member_id
order by m.member_name, p.purchase_date
