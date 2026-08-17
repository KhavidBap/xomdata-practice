-- Xom Data · Deal count per client
-- Problem: https://xomdata.com/practice/easy-join-007
-- Solved: 2026-08-17

-- Viết SQL của bạn ở đây
select c.client_name, count(d.id) as num_deals
from deals d
join clients c on c.id = d.client_id
group by c.client_name
order by num_deals desc, c.client_name
