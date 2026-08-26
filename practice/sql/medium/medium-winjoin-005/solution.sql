-- Xom Data · This invoice's share of the client's spend
-- Problem: https://xomdata.com/practice/medium-winjoin-005
-- Solved: 2026-08-26

-- Viết SQL của bạn ở đây
select c.client_name, i.invoice_code, i.amount, 
    round(1.0 * i.amount / sum(i.amount) over (partition by c.client_name) * 100, 2) as pct_of_client
from clients c
join invoices i on i.client_id = c.id
order by c.client_name, i.amount desc, i.invoice_code
