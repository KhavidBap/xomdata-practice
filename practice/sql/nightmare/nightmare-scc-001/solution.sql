-- Xom Data · Service clusters with dependency cycles
-- Problem: https://xomdata.com/practice/nightmare-scc-001
-- Solved: 2026-10-08

with recursive nodes as (
    select u as node from edges
    union
    select v as node from edges
), reach as (
    select n.node as src, n.node as dst from nodes n
    union
    select r.src, e.v from reach r join edges e on e.u = r.dst
)

select a.src as node, min(a.dst) as scc_id
from reach a join reach b on b.src = a.dst and b.dst = a.src
group by a.src order by node
