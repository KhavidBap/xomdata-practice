-- Xom Data · Longest path in a DAG (by total weight)
-- Problem: https://xomdata.com/practice/nightmare-longestpath-001
-- Solved: 2026-10-06

with recursive nodes as (
    select u as node from edges
    union
    select v as node from edges
), paths as (
    select n.node as cur_node, 0 as total_weight
    from nodes n
    union all
    select e.v, p.total_weight + e.weight
    from paths p
    join edges e on e.u = p.cur_node
)

select coalesce(max(total_weight), 0) as longest_path_weight
from paths
