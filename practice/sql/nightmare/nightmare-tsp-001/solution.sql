-- Xom Data · Minimum-cost delivery route
-- Problem: https://xomdata.com/practice/nightmare-tsp-001
-- Solved: 2026-10-07

with recursive best_edges as (
    select u, v, min(cost) as cost from edges group by u, v
), nodes as (
    select u as node from edges
    union
    select v as node from edges 
), node_count as (
    select count(*) as n from nodes
), depot as (
    select min(node) as depot_node from nodes
), paths as (
    select d.depot_node as cur_node, 0 as total_cost, array[d.depot_node] as visited
    from depot d
    union all
    select e.v, p.total_cost + e.cost, p.visited || e.v
    from paths p
    join best_edges e on e.u = p.cur_node
    where e.v <> all(p.visited)
), tours as (
    select p.total_cost + e.cost as tour_cost
    from paths p
    cross join node_count nc cross join depot d
    join best_edges e on e.u = p.cur_node and e.v = d.depot_node
    where cardinality(p.visited) = nc.n
)

select min(tour_cost) as min_tour_cost from tours
