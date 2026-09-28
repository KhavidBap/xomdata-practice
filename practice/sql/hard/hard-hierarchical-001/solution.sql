-- Xom Data · Total sales by org branch
-- Problem: https://xomdata.com/practice/hard-hierarchical-001
-- Solved: 2026-09-28

with recursive hierarchy as (
    select id as root_id, id as agent_id, direct_sales from agents
    union all
    select h.root_id, a.id as agent_id, a.direct_sales
    from hierarchy h join agents a on a.manager_id = h.agent_id
)

select a.id as agent_id, a.name as agent_name, a.direct_sales, sum(h.direct_sales) as team_total
from agents a
join hierarchy h on h.root_id = a.id
group by a.id
order by team_total desc, agent_id
