-- Xom Data · Connected components in a relationship network
-- Problem: https://xomdata.com/practice/nightmare-components-001
-- Solved: 2026-10-06

with recursive sym_edges as (
    select u as src, v as dst from edges
    union
    select v as src, u as dst from edges
), all_nodes as (
    select u as node from edges
    union 
    select v as node from edges
), reachable as (
    select node, node as reached from all_nodes
    union
    select r.node, s.dst from reachable r
    join sym_edges s on s.src = r.reached
)

select node, min(reached) as component
from reachable
group by node 
order by node
