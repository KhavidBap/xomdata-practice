-- Xom Data · Shortest path between all node pairs (Floyd-Warshall)
-- Problem: https://xomdata.com/practice/nightmare-floyd-001
-- Solved: 2026-10-05

with recursive path(u, v, cost, visited) as (
    select n, n, 0, array[n] from (
        select u as n from edges
        union
        select v from edges
    )
    union all
    select p.u, e.v, p.cost + e.cost, visited || e.v
    from path p
    join edges e on e.u = p.v
    where not e.v = any(visited)
)

select u, v, min(cost) as min_cost
from path
group by u, v
order by u, v
