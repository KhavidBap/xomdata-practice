-- Xom Data · Shortest steps to each node from node 1
-- Problem: https://xomdata.com/practice/expert-final-graph-009
-- Solved: 2026-10-08

with recursive uniq_links as (
    select distinct source as u, destination as v from links
), nodes as (
    select u as node from uniq_links
    union
    select v as node from uniq_links
), node_count as (
    select count(*) as n from nodes
), reach as (
    select 1 as node, 0 as hops
    union
    select l.v, r.hops + 1
    from reach r
    join uniq_links l on l.u = r.node
    cross join node_count nc
    where r.hops + 1 < nc.n
), dist as (
    select node, min(hops) as min_hops from reach group by node
), shortest_paths as (
    select 1 as cur_node, 0 as hops, '1' as path
    union all
    select l.v, sp.hops + 1, sp.path || '->' || cast(l.v as text)
    from shortest_paths sp
    join uniq_links l on l.u = sp.cur_node
    join dist d on d.node = l.v and d.min_hops = sp.hops + 1
)

select sp.cur_node as destination, sp.hops as min_hops, sp.path as path
from shortest_paths sp
where sp.cur_node <> 1
order by sp.hops, sp.cur_node, sp.path
