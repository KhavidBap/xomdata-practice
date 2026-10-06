-- Xom Data · K-th cheapest path between two nodes
-- Problem: https://xomdata.com/practice/nightmare-kshortest-001
-- Solved: 2026-10-06

with recursive paths as (
    select c.src as curr_node, 0 as total_cost, array[c.src] as visited
    from config c
    union all
    select e.v, p.total_cost + e.cost, p.visited || e.v
    from paths p
    join edges e on e.u = p.curr_node
    cross join config c
    where e.v <> all(p.visited) and p.curr_node <> c.tgt
), ranked_routes as (
    select p.total_cost,
        row_number() over (order by p.total_cost) as rn
    from paths p
    join config c on p.curr_node = c.tgt
)

select c.k,
    (select r.total_cost from ranked_routes r where r.rn = c.k) as kth_cost
from config c
