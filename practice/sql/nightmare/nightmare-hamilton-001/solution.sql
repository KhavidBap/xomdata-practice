-- Xom Data · Route visiting every location exactly once
-- Problem: https://xomdata.com/practice/nightmare-hamilton-001
-- Solved: 2026-10-06

with recursive uniq_edges as (select distinct u, v from edges),
nodes as (
    select u as node from uniq_edges
    union
    select v as node from uniq_edges
), node_count as (select count(*) as n from nodes),
paths as (
    select nd.node as cur_node, array[nd.node] as visited, 
        cast(nd.node as text) as path
    from nodes nd
    union all
    select e.v, p.visited || e.v, p.path || '->' || cast(e.v as text)
    from paths p
    join uniq_edges e on e.u = p.cur_node
    where e.v <> all(p.visited)
), full_paths as (
    select p.path from paths p
    cross join node_count nc
    where cardinality(p.visited) = nc.n
)

select case when count(*) > 0 then 1 else 0 end as has_path,
    (select fp.path from full_paths fp order by fp.path collate "C" limit 1) as first_path
from full_paths
